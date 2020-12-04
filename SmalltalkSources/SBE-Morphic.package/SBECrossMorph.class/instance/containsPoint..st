geometry testing
containsPoint: aPoint 

	^ (self horizontalBar containsPoint: aPoint)
		or: [self verticalBar containsPoint: aPoint]