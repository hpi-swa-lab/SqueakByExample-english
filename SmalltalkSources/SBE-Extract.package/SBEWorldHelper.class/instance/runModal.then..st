utils
runModal: aBlock then: anotherBlock

	[
		[
			Processor yield.
			anotherBlock value.
			self takeScreenshot.
			self dialogWindow delete
		] forkAt: 42.
	
	aBlock value] forkAt: 42