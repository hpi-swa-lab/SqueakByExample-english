utils
runModal: aBlock then: anotherBlock

	| semaphore modalProcess result |
	semaphore := Semaphore new.
	[
		modalProcess := aBlock newProcess
			copyEnvironmentFrom: Processor activeProcess;
			resume.
		Processor yield.
		self world doOneCycleNow.
		semaphore signal
	] newProcess
		priority: Processor activePriority + 1;
		copyEnvironmentFrom: Processor activeProcess;
		resume.
	semaphore wait.
	[[result := SBEFigureBuilder new executeSafely: anotherBlock.
	self assureScreenshot]
		ensure: [
			modalProcess terminate]]
				ifCurtailed: [semaphore terminateProcess].
	^ result