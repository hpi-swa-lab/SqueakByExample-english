scanning
emphasizeScanner: scanner
	"See comment in #anchoredMorph."

	Smalltalk isMorphic ifFalse:
		[self flag: #knownBug. "NB: WeakSet(Set)>>ifAbsentAdd: is currently broken, so resetCache is never triggered..."
		((knownScanners ifNil: [knownScanners := WeakSet new]) ifAbsentAdd: scanner) ifTrue:
			[self resetCache]].
	
	^ super emphasizeScanner: scanner