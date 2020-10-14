private utils
hideProgressMorphDuring: aBlock

	| progressMorph |
	progressMorph := SystemProgressMorph uniqueInstance.
	progressMorph visible ifFalse: [Transcript showln: 'Nothing to hide'. ^ aBlock value].
	progressMorph hide.
	^ aBlock ensure: [
		progressMorph show]