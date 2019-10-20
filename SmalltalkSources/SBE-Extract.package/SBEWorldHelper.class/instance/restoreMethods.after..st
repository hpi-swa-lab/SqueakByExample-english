utils
restoreMethods: compiledMethods after: aBlock

	| sources |
	sources := compiledMethods
		collect: [:method | (method methodClass -> (method methodClass categoryForSelector: method selector))
			-> method getSourceFromFile]
		as: Dictionary.
	^ aBlock ensure: [
		sources keysAndValuesDo: [:location :source | location key compile: source classified: location value]]