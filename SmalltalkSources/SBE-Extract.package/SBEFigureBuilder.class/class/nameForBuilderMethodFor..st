code generation - constants
nameForBuilderMethodFor: baseName

	^ self
		uniqueNameFrom: 'build' , (baseName asIdentifier: true)
		lest: [:nextName | self canUnderstand: nextName]