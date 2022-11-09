recording
record: aBlock

	self setUpWorld.
	^ [worldHelper beActiveDuring: [aBlock value: self cull: worldHelper]]
		ensure: [self tearDownWorld]