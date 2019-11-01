testing
isCiImage

	^ Smalltalk globals
		at: #SmalltalkCI
		ifPresent: [:sci | [Boolean readCarefullyFrom: (sci getEnv: self shouldBeImplemented)] ifError: [false]]
		ifAbsent: [false]