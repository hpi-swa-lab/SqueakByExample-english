testing
testResumeNotification

	| result |
	[result := builder executeSafely: [
		Notification signal: #foo.
		6 * 7]]
		on: Notification
		do: [:notification | notification resume].
	self assert: 42 equals: result.