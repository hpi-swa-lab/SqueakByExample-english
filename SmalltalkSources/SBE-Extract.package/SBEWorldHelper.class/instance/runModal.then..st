utils
runModal: aBlock then: anotherBlock

	| semaphore modalProcess result |
	semaphore := Semaphore new.
	[
		modalProcess := aBlock fork.
		Processor yield.
		self world doOneCycleNow.
		semaphore signal
	] forkAt: Processor activePriority + 1.
	semaphore wait.
	[result := [SBEFigureBuilder new executeSafely: anotherBlock] ensure: [
		modalProcess terminate]]
			ifCurtailed: [semaphore terminateProcess].
	^ result