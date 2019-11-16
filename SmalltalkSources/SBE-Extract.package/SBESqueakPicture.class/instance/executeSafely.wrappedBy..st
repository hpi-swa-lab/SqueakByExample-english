private
executeSafely: aBlock wrappedBy: aWrapBlock
	"Execute aBlock, wrapped by aWrapBlock, which has to take a block as argument. This execution is safe, which means that exceptions raised by aBlock or even the attempt to kill the process will not affect the caller. If aBlock raises an error, another wrapping exception will be raised. Provided that StandardToolSet is installed, the user can proceed it in order to debug the underlying exception.
	
	For the implementation, this requires us to run aBlock in a different process. The complexity of this code is caused by the need to assure synchronized execution."

	| process buildException debugSemaphore resumeSemaphore result |
	debugSemaphore := Semaphore new.
	resumeSemaphore := Semaphore new.
	"*** EXECUTING aBlock ***"
	[
		aWrapBlock value: [
			| success |
			process := [
				success := false.
				[
					result := aBlock on: UnhandledError, ProvideAnswerNotification do: [:exception |
						buildException := exception.
						resumeSemaphore signal.
						debugSemaphore wait.
						exception pass
					]
				] ifCurtailed: [
					[resumeSemaphore terminateProcess] ifError: [
						self flag: #workaround "ct: Terminating the process actually raises an error in #runUntilErrorOrReturnFrom:; dunno how to fix this, but ignoring it works for the moment ..."
					]
				].
				resumeSemaphore signal.
				success := true.
			] forkAt: Processor activePriority + 1.
			"If no error occurred, return control here"
			success ifTrue: [^ result]
		]
	] ensure: [
		Project current world doOneCycleNow
	].
	process isTerminated ifTrue: [
		^ self error: 'Build block terminated process'].
	
	"*** EXCEPTION DISPATCHING ***"
	[
		[
			Project current spawnNewProcessDuring: [
				resumeSemaphore wait].
			process isTerminated
		] whileFalse: [
			[
				Error new
					tag: {self buildBlock. buildException};
					signal: ('[Proceed to debug] Build block raised exception: "{1}". Stack: "{2}".'
						format: { buildException. buildException signalerContext longStack }).
			] ifCurtailed: [
				debugSemaphore terminateProcess
			].
			debugSemaphore signal.
			buildException := nil
		]
	] ensure: [
		process terminate
	].
	^ result