private
executeShould: aBlock inScopeOf: anExceptionalEvent where: aPredicate

	^ [aBlock value.
	false]
		on: anExceptionalEvent
		do: [:ex |
			(aPredicate value: ex)
				ifFalse: [ex pass]
				ifTrue: [ex return: true]]
			