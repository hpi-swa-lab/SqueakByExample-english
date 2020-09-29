private
systemVersionString

	| version |
	version := SystemVersion current.
	^ version majorMinorVersion allButFirst: version baseName size