code generation
compileScript: script

	| methodName |
	methodName := self nameForBuilderScript: script.
	self
		compile: (String streamContents: [:stream |
			stream
				nextPutAll: methodName;
				crtab; nextPutAll: '<generated>';
				cr.
			script lines do: [:line |
				stream crtab; nextPutAll: line]])
		classified: self builderMethodCategory.