utils
runModal: aBlock then: anotherBlock

	[
		| modalProcess |
		modalProcess := aBlock fork.
		Processor yield.
		ActiveWorld doOneCycleNow.
		anotherBlock ensure: [
			modalProcess terminate]
	] forkAt: Processor activePriority + 1.