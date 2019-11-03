building (convenience)
buildTexFiguresFrom: aFileReference
	"If the build was successful, remove the generated code afterwards"

	self okToGenerate ifFalse: [^ false].
	^ Project current uiManager informUserDuring: [:bar |
		bar value: 'Building figures ...'.
		[| builders success |
		builders := self generateBuildersIn: aFileReference.
		success := self buildFiguresWith: builders.
		success ifTrue: [builders do: #removeFromSystem].
		success]
			valueSuppressingMessages: #('*safety checks*')]