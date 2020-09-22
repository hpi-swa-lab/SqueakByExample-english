initialize-release
useHelper: aWorldHelper during: aBlock

	| previousHelper |
	previousHelper := worldHelper.
	worldHelper := aWorldHelper.
	^ aBlock ensure: [
		worldHelper := previousHelper]