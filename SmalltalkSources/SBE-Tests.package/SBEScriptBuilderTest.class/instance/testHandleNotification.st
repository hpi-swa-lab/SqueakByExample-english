testing
testHandleNotification

	self
		should: [
			builder executeSafely: [
				Notification signal: #foo.
				6 * 7]]
		raise: Notification
		where: [:notification | notification messageText = #foo].