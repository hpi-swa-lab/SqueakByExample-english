utils
select: aMorph where: aPredicate

	| firstSelection |
	firstSelection := nil.
	[aMorph selection
			ifNotNil: [:selection | aPredicate value: selection]
			ifNil: [false]] whileFalse: [
		| latestSelection |
		latestSelection := aMorph selection.
		firstSelection ifNil: [firstSelection := latestSelection].
		self keyStroke: aMorph key: Character arrowDown.
		({nil. firstSelection. latestSelection} includes: aMorph selection) ifTrue: [
			^ self error: 'No item found matching ', aPredicate]].