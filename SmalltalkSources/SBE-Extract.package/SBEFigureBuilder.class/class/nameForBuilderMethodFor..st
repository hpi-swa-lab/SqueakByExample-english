code generation - constants
nameForBuilderMethodFor: aName

	^ self
		uniqueNameFrom: 'build' , (aName asIdentifier: true)
		lest: [:name | self canUnderstand: name]