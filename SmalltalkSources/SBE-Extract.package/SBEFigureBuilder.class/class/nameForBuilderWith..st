code generation - constants
nameForBuilderWith: aName

	^ ('SBE{1}FigureBuilder' format: {
		(aName findFeatures collect: #capitalized) join}) asSymbol