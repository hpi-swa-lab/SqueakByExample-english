utils
hideProgressMorph

	| progressMorph |
	progressMorph := SystemProgressMorph uniqueInstance.
	progressMorph visible ifFalse: [^ self].
	progressMorph hide.
	hiddenMorphs add: progressMorph.