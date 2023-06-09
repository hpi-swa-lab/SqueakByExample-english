accessing
scaleFactor

	ScaleFactor ifNotNil: [^ ScaleFactor].
	(Smalltalk classNamed: #SmalltalkCI) ifNotNil: [:sci |
		(sci getEnv: #SBE_SCALE_FACTOR) ifNotNil: [:factor |
			^ factor]].
	^ 1.0