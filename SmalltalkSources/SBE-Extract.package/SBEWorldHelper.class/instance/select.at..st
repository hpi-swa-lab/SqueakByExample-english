utils
select: aMorph at: anItemMatch

	(aMorph isKindOf: DialogWindow) ifTrue: [
		^ self select: aMorph where: [:selection | anItemMatch matches: selection label]].
	(aMorph isKindOf: MenuMorph) ifTrue: [
		^ self select: aMorph where: [:selection | anItemMatch matches: selection contents]].
	^ self select: aMorph where: [:selection | anItemMatch matches: selection]