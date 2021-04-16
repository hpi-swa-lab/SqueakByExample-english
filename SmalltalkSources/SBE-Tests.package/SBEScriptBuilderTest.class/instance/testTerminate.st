testing
testTerminate

	self fail: 'ct: Not yet implemented'.
	
	builder executeSafely: [
		Processor activeProcess terminate].