debugging
openScene: aScene

	^ aScene
		buildWith: worldHelper;
		open