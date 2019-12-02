utils
select: aMorph where: aPredicate

	| firstSelection |
	firstSelection := aMorph selection.
	[aMorph selection
			ifNotNil: [:selection | aPredicate value: selection]
			ifNil: [false]] whileFalse: [
		| latestSelection |
		latestSelection := aMorph selection.
		self keyStroke: aMorph key: Character arrowDown.
		Transcript showln: latestSelection asString , ' -> ' , aMorph selection.
		({firstSelection. latestSelection} includes: aMorph selection) ifTrue: [
			^ self error: 'No item found matching ', aPredicate]].