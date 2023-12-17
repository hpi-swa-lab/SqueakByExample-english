emitting
emitImportantDuring: aBlock

	^ self stream withAttribute: (TextIndent tabs: 1) do: aBlock