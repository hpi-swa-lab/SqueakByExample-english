scanning
emphasizeScanner: scanner

	((knownScanners ifNil: [knownScanners := WeakSet new]) ifAbsentAdd: scanner) ifTrue:
		[self resetCache].
	scanner textColor: self actualColor.