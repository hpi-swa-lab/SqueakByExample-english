utils
mcIgnoreAllModificationsBut: excludedPackageNames during: aBlock

	| modifications |
	modifications := (MCWorkingCopy allManagers select: #modified)
		reject: [:package | excludedPackageNames includes: package packageName].
	^ [modifications do: [:package | package silentlyModified: false].
	aBlock value]
		ensure: [modifications do: [:package | package silentlyModified: true]]