code generation - constants
uniqueNameFrom: baseName lest: aPredicate

	^ self
		uniqueNameBy: [:number | baseName , number]
		lest: aPredicate