utils
mcIgnoreAllModificationsDuring: aBlock

	^ self mcIgnoreAllModificationsBut: #() during: aBlock