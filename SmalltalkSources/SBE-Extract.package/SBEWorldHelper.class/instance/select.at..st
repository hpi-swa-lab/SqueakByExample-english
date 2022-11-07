utils
select: aMorph at: anItemMatch

	(aMorph isKindOf: DialogWindow) ifTrue: [
		^ self select: aMorph where: [:selection | anItemMatch matches: selection]].
	(aMorph isKindOf: MenuMorph) ifTrue: [
		^ self select: aMorph where: [:selection | anItemMatch matches: selection contents]].
	^ self select: aMorph where: [:selection | anItemMatch matches: selection]