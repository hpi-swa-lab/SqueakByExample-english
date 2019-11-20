testing
testResumeDebugger

	self
		shouldOpenDebugger: [
			builder executeSafely: [
				self halt]]
		thenDo: #proceed.