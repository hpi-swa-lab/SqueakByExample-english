accessing
projectClass

	^ (self environment classNamed: #MetacelloCypressBaselineProject) ifNil: [super projectClass]