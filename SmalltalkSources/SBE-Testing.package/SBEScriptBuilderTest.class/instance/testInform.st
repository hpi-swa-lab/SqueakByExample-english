testing
testInform

	self fail: 'ct: Not yet implemented.'.
	self flag: #discuss. "Not sure whether we want to block this at all 🤔"
	
	self
		should: [builder executeSafely: [self inform: #foo]]
		raise: Error.