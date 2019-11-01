utils
runModal: aBlock then: anotherBlock

	| semaphore result |
	semaphore := Semaphore new.
	[
		| modalProcess |
		modalProcess := aBlock fork.
		Processor yield.
		self world doOneCycleNow.
		[result := anotherBlock ensure: [
			modalProcess terminate]]
				ifCurtailed: [semaphore terminateProcess].
		semaphore signal
	] forkAt: Processor activePriority + 1.
	semaphore wait.
	^ result