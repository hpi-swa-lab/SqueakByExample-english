recording
writeInto: aDirectory recordSeries: aBlock

	^ (self newAtDirectory: aDirectory)
		record: aBlock