accessing
shouldOpenDebugger: aBlock that: aPredicate thenDo: aHandlerBlock

	| result semaphore |
	semaphore := Semaphore new.
	"Run aBlock in a separate thread. Debugging behaves different in the UI thread."
	[["Avoid Debugger from being opened in hand during test"
	Preferences
		setPreference: #(UIManager >> openToolsAttachedToMouseCursor) join asSymbol
		toValue: false
		during: [
			result := self
				should:
					(self
						executeShould:
							[aBlock value.
							Processor yield]
						inScopeOfDebuggerThat: aPredicate
						thenDo: aHandlerBlock)
				description: 'aBlock should open debugger, but none found']]
		ensure: [semaphore signal]] fork.
	Processor yield.
	Project current spawnNewProcessDuring: [
		semaphore wait].
	^ result