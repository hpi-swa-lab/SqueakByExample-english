*SBE-Extract-scaling
sbeDefaultExtent

	^ true caseOf: {
		[self isNotifier] -> [self initialExtentForNotifier].
		[self isFull] -> [600 @ 400]. }