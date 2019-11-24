building
buildTexFiguresFrom: aFileReference
	"If the build was successful, remove the generated code afterwards"

	^ Project current uiManager informUserDuring: [:bar |
		| builders success |
		bar value: 'Building figures ...'.
		builders := self generateBuildersIn: aFileReference.
		success := self buildFiguresWith: builders.
		success ifTrue: [builders do: #removeFromSystem].
		success]