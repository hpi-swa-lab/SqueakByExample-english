as yet unclassified
closeBalloons

	self world submorphs select: [:m | m isKindOf: NewBalloonMorph] thenDo: #delete.