code generation - constants
uniqueNameBy: baseNameSelector lest: aPredicate

	^ self
		uniqueNameFrom: (baseNameSelector value: '')
		orNumberedNameBy: baseNameSelector
		lest: aPredicate