private
executeShould: aBlock inScopeOfDebuggerThat: aPredicate thenDo: aHandlerBlock

	| handleSemaphore blockSemaphore oldDebuggers handlerProcess |
	handleSemaphore := Semaphore new.
	blockSemaphore := Semaphore new.
	[oldDebuggers := self findDebuggersThat: aPredicate.
	handlerProcess := [| newDebuggers |
	[100 milliSeconds wait.
	newDebuggers := (self findDebuggersThat: aPredicate) copyWithoutAll: oldDebuggers]
		doWhileFalse: [newDebuggers notEmpty].
	self assert: [newDebuggers size = 1].
	aHandlerBlock value: newDebuggers anyOne model.
	Processor yield.
	handleSemaphore signal] fork.
	
	[aBlock value.
	blockSemaphore signal] fork.
	[Processor yield.
	blockSemaphore isSignaled ifTrue: [
		^ false]] doWhileFalse: [
			handleSemaphore isSignaled].
	^ true]
				ensure: [
					handlerProcess ifNotNil: #terminate.
					{handleSemaphore. blockSemaphore} do: #terminateProcess].