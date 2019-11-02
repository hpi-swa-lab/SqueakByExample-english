utils
select: aMorph at: anItemMatch

	(aMorph isKindOf: DialogWindow) ifTrue: [
		^ self select: aMorph where: [:selection | anItemMatch matches: selection label]].
	^ self select: aMorph where: [:selection | anItemMatch matches: selection]