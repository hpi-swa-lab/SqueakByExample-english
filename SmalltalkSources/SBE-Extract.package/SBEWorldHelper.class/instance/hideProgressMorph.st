utils
hideProgressMorph

	| progressMorph |
	progressMorph := SystemProgressMorph uniqueInstance.
	progressMorph visible ifFalse: [Transcript showln: 'Nothing to hide'. ^ self].
	progressMorph hide.
	hiddenMorphs add: progressMorph.