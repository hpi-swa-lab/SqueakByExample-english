utils
runModal: aBlock then: anotherBlock

	[
		| modalProcess |
		modalProcess := aBlock fork.
		Processor yield.
		self world doOneCycleNow.
		anotherBlock ensure: [
			modalProcess terminate]
	] forkAt: Processor activePriority + 1.