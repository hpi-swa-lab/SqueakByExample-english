visiting - commands
commandPdfMinorVersion: arguments
	<command: 'pdfminorversion'>

	self assert: arguments isEmpty.
	parseStack push:
		(Generator on: [:gen |
			| nodes |
			self assert: gen next isNil. "whyever"
			self assert: gen next contents = '='.
			nodes := Generator on: [:nodeStream |
				| node |
				node := gen next.
				node sbeType = #genericCommand
					ifFalse: [nodeStream nextPutAll: node children]
					ifTrue:
						[nodeStream
							nextPut: node;
							nextPutAll: gen]].
			
			self assert: nodes next sbeType = #word.
			
			#back.
			nodes := nodes upToEnd.
			parseStack pop.
			nodes do: [:ea | self visit: ea].
			gen next]).