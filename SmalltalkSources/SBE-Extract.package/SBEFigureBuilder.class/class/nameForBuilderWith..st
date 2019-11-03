code generation - constants
nameForBuilderWith: baseName

	| identifierName |
	identifierName := baseName asIdentifier: true.
	^ self
		uniqueNameBy: [:number | 'SBE{1}{2}FigureBuilder' format: {identifierName. number}]
		lest: [:nextName | Smalltalk hasClassNamed: nextName]