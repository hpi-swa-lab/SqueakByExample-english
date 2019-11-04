utils
select: aMorph where: aPredicate

	| firstSelection |
	firstSelection := aMorph selection.
	[aPredicate value: aMorph selection] whileFalse: [
		| latestSelection |
		latestSelection := aMorph selection.
		self keyStroke: aMorph key: Character arrowDown.
		({firstSelection. latestSelection} includes: aMorph selection) ifTrue: [
			^ self error: 'No item found matching ', aPredicate]].