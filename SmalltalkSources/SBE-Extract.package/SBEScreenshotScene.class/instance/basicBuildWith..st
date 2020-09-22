building
basicBuildWith: aWorldHelper

	^ (buildBlock respondsTo: #cull:)
		ifTrue: [buildBlock cull: aWorldHelper]
		ifFalse: [buildBlock value]