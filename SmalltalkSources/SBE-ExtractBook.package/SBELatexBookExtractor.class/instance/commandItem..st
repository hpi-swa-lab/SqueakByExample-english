visiting - commands
commandItem: arguments
	<command: 'item'>

	| argumentStream listMode label indent |
	argumentStream := arguments readStream.
	listMode := listModeStack isEmpty ifFalse: [listModeStack top].
	((#(description nil) includes: listMode) and: [argumentStream peek sbeType = #brackGroupText]) ifTrue:
		[label := self fullContentsInGroup: argumentStream next brackets: '[]'.
		listMode := #description].
	
	listMode = #enumerateStar
		ifFalse: [self emitLineBreak: true].
	
	indent := (listModeStack size - 1 timesCollect: [String tab]) join.
	true caseOf:
		{[listMode = #description and: [label notNil]] ->
			[self stream nextPutAll: indent.
			self emitItemLabel: label; basicVisitText: String space].
		[listMode isNil or: [listMode = #itemize]] ->
			[self stream nextPutAll: indent.
			self basicVisitText: '* '].
		[listMode = #enumerate] ->
			[| count |
			count := enumerateStack pop + 1.
			enumerateStack push: count.
			self stream nextPutAll: indent.
			self basicVisitText: ('{1}. ' format: {count})].
		[listMode = #enumerateStar] ->
			[| count |
			count := enumerateStack pop + 1.
			enumerateStack push: count.
			self basicVisitText: (' ({1}) ' format: {count})]}.
	argumentStream do: [:arg |
		self visit: arg].
	
	parseStack push:
		(Generator on: [:gen |
			self assert: gen next isNil. "whyever"
			
			[gen peek notNil and: [gen peek sbeType = #linebreak or: [gen peek sbeType isNil and: [gen peek contents isAllSeparators]]]] whileTrue:
				[gen next].
			
			self assert: parseStack pop == gen.
			gen peek ifNotNil: [self visit: gen peek].
			parseStack push: gen]).