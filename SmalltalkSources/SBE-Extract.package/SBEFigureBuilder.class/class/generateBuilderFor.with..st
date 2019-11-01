code generation
generateBuilderFor: file with: commands

	| class className |
	className := self nameForBuilderWith: file base.
	class := Smalltalk at: className ifAbsent: [
		self subclass: className category: self builderSystemCategory].
	class
		fileReference: file;
		compileCommands: commands.
	^ class