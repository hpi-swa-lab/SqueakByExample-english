recording
doesNotUnderstand: aMessage

	(self buildingSelectorPattern matches: aMessage selector)
		ifFalse: [^ super doesNotUnderstand: aMessage].
	^ self record: [:recorder |
		aMessage sendTo: recorder]