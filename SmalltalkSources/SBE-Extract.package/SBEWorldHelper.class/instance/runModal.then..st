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
	[result := [SBESqueakPicture new executeSafely: anotherBlock wrappedBy: [:block | block value]] ensure: [
		modalProcess terminate]]
			ifCurtailed: [semaphore terminateProcess].
	^ result