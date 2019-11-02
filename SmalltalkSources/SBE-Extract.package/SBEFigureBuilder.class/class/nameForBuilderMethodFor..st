code generation - constants
nameForBuilderMethodFor: aName

	^ 'build' , (aName findFeatures collect: #capitalized) join