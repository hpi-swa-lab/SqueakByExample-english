testing
testAbandonDebugger

	self
		shouldOpenDebugger: [
			builder executeSafely: [
				self halt]]
		thenDo: #abandon.