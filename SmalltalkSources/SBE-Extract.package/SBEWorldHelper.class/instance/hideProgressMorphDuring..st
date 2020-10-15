private utils
hideProgressMorphDuring: aBlock

	| progressMorph |
	progressMorph := SystemProgressMorph uniqueInstance.
	progressMorph visible ifFalse: [^ aBlock value].
	progressMorph hide.
	^ aBlock ensure: [
		progressMorph show]