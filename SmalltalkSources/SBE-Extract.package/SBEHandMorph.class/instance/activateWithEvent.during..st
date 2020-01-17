private
activateWithEvent: anEvent during: aBlock

	thisContext
		wrap: [:block | self world becomeActiveDuring: block];
		wrap: [:block | self becomeActiveDuring: block];
		wrap: [:block | anEvent becomeActiveDuring: block].
	^ aBlock value