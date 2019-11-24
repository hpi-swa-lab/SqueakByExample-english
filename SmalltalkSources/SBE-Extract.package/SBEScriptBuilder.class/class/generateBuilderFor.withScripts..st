code generation
generateBuilderFor: file withScripts: scripts

	| class className |
	className := self nameForBuilderWith: file base.
	class := Smalltalk at: className ifAbsent: [
		self subclass: className category: self builderSystemCategory].
	class compileScripts: scripts.
	^ class