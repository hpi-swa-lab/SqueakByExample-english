*SBE-Extract-accessing-override
maximumUsableAreaInWorld: aWorldOrNil

	| allowedArea |
	aWorldOrNil ifNotNil: [(aWorldOrNil valueOfProperty: #sbeMaximumUsableArea) ifNotNil: [:area | ^ area]].
	
	allowedArea := Display usableArea.
	aWorldOrNil ifNotNil: [
		Smalltalk isMorphic ifTrue: [
			allowedArea := allowedArea intersect: aWorldOrNil visibleClearArea.
			(((Smalltalk classNamed: 'Flaps') ifNil: [false] ifNotNil: [:cls | cls anyFlapsVisibleIn: aWorldOrNil])
				and: [self respondsTo: #reduceByFlaps:])
					ifTrue: [allowedArea := self reduceByFlaps: allowedArea]]].
	^allowedArea