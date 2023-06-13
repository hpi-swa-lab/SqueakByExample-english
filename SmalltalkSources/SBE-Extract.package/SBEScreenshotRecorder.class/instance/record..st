recording
record: aBlock

	self setUpWorld.
	^ [[worldHelper beActiveDuring: [aBlock value: self cull: worldHelper]]
		ifCurtailed: [
			Transcript showln: thisContext stack.
			"ToolSet debugException: (Halt new searchFrom: thisContext)."
			Smalltalk logSqueakError: 'just a test' inContext: thisContext; flag: #debug]]
				ensure: [self tearDownWorld]