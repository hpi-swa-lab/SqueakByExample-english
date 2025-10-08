visiting - commands
commandLstNewEnvironment: arguments
	<command: 'lstnewenvironment'>

	| name allArguments allOptions |
	self assert: arguments size = 1.
	name := (self fullContentsInGroup: arguments first optionalBrackets: true) asString.
	
	allOptions := OrderedCollection new.
	allArguments := OrderedCollection with: arguments first.
	
	parseStack push:
		(Generator on: [:gen |
			| handler |
			self assert: gen next isNil. "whyever"
			
			(1 to: 2) allSatisfy: [:i |
				(gen peek sbeType isNil and: [gen peek contents = '['])
					ifTrue:
						[gen next.
						allOptions addLast: gen next.
						self assert: gen next contents = ']'];
					yourself].
			allOptions ifNotEmpty:
				[allArguments addLast:
					(DCBlock new
						type: #brackGroupArgc;
						addMorphBack:
							(DCText new contents: '['; yourself);
						addMorphBack: allOptions first;
						addMorphBack:
							(DCText new contents: ']'; yourself);
						yourself)].
			
			2 timesRepeat:
				[self assert: gen peek sbeType = #curlyGroup.
				allArguments addLast: gen next].
			
			handler := self commandNewEnvironment: allArguments.
			environmentHandlers at: name put:
				[:extractor :contentBlock :options |
					handler
						value: extractor
						value:
							[extractor
								environmentCode: contentBlock
								options: #()]
						value: options].
			
			"todo?"]).