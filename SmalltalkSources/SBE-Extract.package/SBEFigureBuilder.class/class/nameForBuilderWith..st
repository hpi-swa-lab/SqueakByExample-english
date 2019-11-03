code generation - constants
nameForBuilderWith: aName

	| identifierName |
	identifierName := aName asIdentifier: true.
	^ self
		uniqueNameBy: [:number | 'SBE{1}{2}FigureBuilder' format: {identifierName. number}]
		lest: [:name | Smalltalk hasClassNamed: name]