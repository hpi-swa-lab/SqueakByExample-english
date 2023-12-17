scanning
emphasizeScanner: scanner

	((knownScanners ifNil: [knownScanners := WeakSet new]) ifAbsentAdd: scanner) ifTrue:
		[self resetCache].
	
	^ super emphasizeScanner: scanner