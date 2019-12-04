running
recordScene: aScene during: aBlock

	| previousScene |
	previousScene := aScene.
	scene := aScene.
	^ aBlock ensure: [
		scene := previousScene]