utils
restoreMethods: compiledMethods after: aBlock

	| changeRecords |
	changeRecords := (compiledMethods copyWithout: nil)
		collect: [:method | method -> (method methodClass changeRecordsAt: method selector) first]
		as: Dictionary.
	^ aBlock ensure: [
		changeRecords do: #fileIn]