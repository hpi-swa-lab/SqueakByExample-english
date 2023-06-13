utils
select: aMorph at: anItemMatch

	^ self select: aMorph where:
		((aMorph isKindOf: MenuMorph orOf: PluggableTreeMorph)
			ifTrue: [[:selection | anItemMatch matches: selection contents]]
			ifFalse: [[:selection | anItemMatch matches: selection]])