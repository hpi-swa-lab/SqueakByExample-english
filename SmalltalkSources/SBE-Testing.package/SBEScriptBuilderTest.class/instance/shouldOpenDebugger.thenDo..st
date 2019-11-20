accessing
shouldOpenDebugger: aBlock thenDo: aHandlerBlock

	^ self
		shouldOpenDebugger: aBlock
		that: [:debugger | true]
		thenDo: aHandlerBlock