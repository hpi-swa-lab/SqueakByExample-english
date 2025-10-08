visiting - environments
environmentCode: contentBlock options: options
	<environment: 'code'>

	self basicVisitLineBreak: contentBlock; basicVisitLineBreak: contentBlock.
	
	self emitCodeDuring:
		[| oldStream code |
		oldStream := self stream.
		stream := TextStream on: Text new.
		[parseStack push:
			(Generator on: [:gen |
				self assert: gen next isNil. "whyever"
				
				[gen peek sbeType = #linebreak or: [gen peek sbeType isNil and: [gen peek contents isAllSeparators]]] whileTrue:
					[gen next].
				
				"ignore first argument"
				self assert: parseStack pop == gen.
				self visit: gen peek.
				parseStack push: gen]).
			
			contentBlock value.
		code := self stream contents.
		
		code := code withBlanksTrimmed. "because in #commandLstNewEnvironment: we pass whitespaces to contentBlock inside verbatim mode"
	
		self flag: #hacked. "yeah ... actually we should parse and visit this separately, but currently this seems to work good enough"
		"code := code copyWithRegex: (matcher := '!([^!]+)!' asRegex) matchesTranslatedUsing: [:match |
			matcher subexpression: 2]."
		code := Text streamContents: [:codeStream |
			| index |
			index := 0.
			[(index := index + 1) <= code size] whileTrue:
				[(code at: index) = $!
					ifFalse:
						[codeStream withAttributes: (code attributesAt: index) do:
							[codeStream nextPut: (code at: index)]]
					ifTrue:
						[| nextIndex match |
						(nextIndex := code indexOf: $! startingAt: (index := index + 1)) = 0
							ifFalse:
								[match := code copyFrom: index to: nextIndex - 1.
								codeStream nextPutAll: match.
								index := nextIndex]
							ifTrue:
								["single ! is printed literally"
								codeStream nextPutAll:
									(code copyFrom: index - 1 to: index - 1)]]]].]
			ensure:
				[stream := oldStream].
	
		self basicVisitText: code].
	
	self basicVisitLineBreak: contentBlock; basicVisitLineBreak: contentBlock.