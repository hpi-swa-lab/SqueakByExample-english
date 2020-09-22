utils
hideProgressMorph

	| progressMorph |
	progressMorph := SystemProgressMorph uniqueInstance.
	progressMorph isInWorld ifFalse: [^ self].
	progressMorph delete.
	hiddenMorphs add: progressMorph.