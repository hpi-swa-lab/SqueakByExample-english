visiting - commands
commandNumFileTreeMethodInput: arguments
	<command: 'numFiletreeMethodInput'>

	| listingFile listingSource |
	self flag: #workaround. "we wanted to implement lstinputlisting instead but the grammar stumbles up on this command's definition"
	nodeStack size > 1 ifFalse: [^ self]. "yeah due to same hickup"
	self assert: arguments isEmpty.
	
	parseStack push:
		(Generator on: [:gen |
			| allArguments |
			self assert: gen next isNil. "whyever"
			
			allArguments := OrderedCollection new: 3.
			
			self assert: (gen peek sbeType isNil and: [gen next contents = '[']).
			allArguments addLast: gen next.
			self assert: gen next contents = ']'.
			
			2 timesRepeat:
				[[gen atEnd not and: [(#(linebreak lineComment) includes: gen peek sbeType) or: [gen peek sbeType isNil and: [gen peek contents isAllSeparators]]]] whileTrue:
						[gen next].
				allArguments addLast: gen next].
			
			self assert: parseStack pop == gen.
			
			self emitCaptionDuring:
				[self emitEmphasisDuring:
					[self visit: allArguments second]].
			self basicVisitLineBreak: nil; basicVisitLineBreak: nil.
			
			self emitLabel: 'mth:' , (self contentsIn: allArguments first) asString.
			
			listingFile := self tryResolveFile: (self contentsIn: allArguments third) asString.
			listingSource := listingFile contents copyReplaceAll: String crlf with: String cr.
			self
				environmentCode: [self basicVisitText: listingSource]
				options: #().
			
			parseStack push: gen]).