initialize-release
initialize

	super initialize.
	
	booleans := Dictionary new.
	counters := Dictionary new.
	self resetStream.
	self initializeCommandHandlers.
	self initializeEnvironmentHandlers.
	parseStack := Stack new. "generators for consuming tokens from previous visitors"
	ifstack := Stack new. "values and booleans for computations"
	verbatim := false.
	listModeStack := Stack new.
	enumerateStack := Stack new.
	index := SBEIndex new
		key: #index;
		yourself.