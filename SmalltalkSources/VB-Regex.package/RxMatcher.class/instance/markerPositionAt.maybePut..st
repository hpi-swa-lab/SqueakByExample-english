privileged
markerPositionAt: anIndex maybePut: position
	"Set position of the given marker, if not already set."
	(markerPositions at: anIndex) == nil
		ifTrue:	[markerPositions at: anIndex put: position]