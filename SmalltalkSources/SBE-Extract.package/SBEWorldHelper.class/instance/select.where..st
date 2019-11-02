utils
select: aMorph where: aPredicate

	[aPredicate value: aMorph selection] whileFalse: [
		| latestSelection |
		latestSelection := aMorph selection.
		self keyStroke: aMorph key: Character arrowDown.
		aMorph selection = latestSelection ifTrue: [
			^ self error: 'No item found matching ', aPredicate]].