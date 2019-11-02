private utils
hideProgressMorphDuring: aBlock

	| progressMorph |
	progressMorph := SystemProgressMorph uniqueInstance.
	progressMorph isInWorld
		ifFalse: [^ aBlock value].
	progressMorph delete.
	^ aBlock ensure: [
		progressMorph openInWorld]