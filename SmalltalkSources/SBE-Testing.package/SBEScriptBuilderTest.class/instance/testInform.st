testing
testInform

	self
		should: [builder executeSafely: [self inform: #foo]]
		raise: Error.