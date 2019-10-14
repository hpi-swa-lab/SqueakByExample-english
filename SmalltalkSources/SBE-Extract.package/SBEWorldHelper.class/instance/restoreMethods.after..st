utils
restoreMethods: aCollectionOfCompiledMethods after: aBlock

	| sources |
	sources := aCollectionOfCompiledMethods collect: #getSourceFromFile.
	aBlock ensure: [aCollectionOfCompiledMethods with: sources do: [:method :source | method methodClass compile: source]]