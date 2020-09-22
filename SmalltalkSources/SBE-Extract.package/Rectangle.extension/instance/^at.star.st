*SBE-Extract-transforming
@* relativeScalar

	^ relativeScalar pointsTransform: [:point | self origin + (self extent * point)]