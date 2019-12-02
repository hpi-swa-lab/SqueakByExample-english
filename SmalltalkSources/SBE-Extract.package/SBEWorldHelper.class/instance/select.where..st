utils
select: aMorph where: aPredicate

	| firstSelection |
	firstSelection := aMorph selection.
	Transcript showln: 'About to select ' , aPredicate , ' in ' , aMorph , ' (initially selected ' , firstSelection , ', inst vars: ' , aMorph longPrintString , ')'.
	Transcript showln: 'feyboardFocus morph is ' , hand keyboardFocus.
	[aMorph selection
			ifNotNil: [:selection | aPredicate value: selection]
			ifNil: [false]] whileFalse: [
		| latestSelection |
		latestSelection := aMorph selection.
		self keyStroke: aMorph key: Character arrowDown.
		Transcript showln: latestSelection asString , ' -> ' , aMorph selection.
		Transcript showln: 'feyboardFocus morph is ' , hand keyboardFocus.
		({firstSelection. latestSelection} includes: aMorph selection) ifTrue: [
			^ "self error: 'No item found matching ', aPredicate"nil flag: #DEBUG]].