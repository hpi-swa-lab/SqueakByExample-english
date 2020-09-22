*SBE-Extract-transforming
* relativeScalar

	relativeScalar isRectangle ifTrue: [
		^ self @* relativeScalar origin corner: self @* relativeScalar corner].
	^ self scaleBy: relativeScalar