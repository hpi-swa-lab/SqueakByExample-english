debugging
allInvalidLinks

	^ self invalidLinks ,
		(self subtopics gather: [:topic | topic allInvalidLinks])