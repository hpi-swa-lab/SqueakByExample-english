running
recordScene: aScene during: aBlock

	scene := aScene.
	^ aBlock ensure: [
		scene := nil]