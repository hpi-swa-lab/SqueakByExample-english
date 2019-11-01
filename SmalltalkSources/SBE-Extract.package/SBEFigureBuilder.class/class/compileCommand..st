code generation
compileCommand: command

	| picture name |
	picture := Compiler new evaluateWithTempNames: command.
	name := self nameForBuilderMethodFor:
		(self fileReference parent resolvePath: picture filePath) base.
	self
		compile: (String streamContents: [:stream |
			| pictureLines |
			stream
				nextPutAll: name;
				crtab; nextPutAll: '<generated>';
				cr;
				crtab; nextPutAll: '| picture |';
				crtab; nextPutAll: 'picture := '.
			pictureLines := picture storeString lines.
			stream nextPutAll: pictureLines first.
			pictureLines allButFirst do: [:line |
				stream crtab: 2; nextPutAll: line].
			stream
				nextPut: $.;
				crtab; nextPutAll: 'picture saveIn: self targetDirectory.'])
		classified: self builderMethodCategory.