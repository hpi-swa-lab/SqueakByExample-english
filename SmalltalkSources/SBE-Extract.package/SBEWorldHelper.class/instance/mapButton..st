private
mapButton: aSymbol

	^ (Dictionary newFrom: {
		#left   -> 16r04. "red"
		#middle -> 16r01. "blue"
		#right  -> 16r02. "yellow"
		#shift  -> 16r08.
		#ctrl   -> 16r10.
		#cmd    -> 16r40. "alt"
	}) at: aSymbol ifAbsent: [Error signal: 'Unknown button symbol!']
