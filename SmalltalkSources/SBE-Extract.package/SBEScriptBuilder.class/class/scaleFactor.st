accessing
scaleFactor

	ScaleFactor ifNotNil: [^ ScaleFactor].
	(Smalltalk classNamed: #SmalltalkCI) ifNotNil: [:sci |
		(sci getEnv: #SBE_SCALE_FACTOR) ifNotNil: [:value |
			| factor |
			factor := value asNumber.
			self assert: (factor > 0 and: [factor < 100]) description: 'invalid scale factor provided'.
			^ factor]].
	^ 1.0