utils
restoreMethods: compiledMethods after: aBlock

	| changeRecords |
	changeRecords := compiledMethods
		collect: [:method | method -> (method methodClass changeRecordsAt: method selector) first]
		as: Dictionary.
	^ aBlock ensure: [
		changeRecords do: #fileIn]