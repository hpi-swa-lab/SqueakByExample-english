resolving
tryResolveFile: fileName extensions: extensions paths: paths

	| names resolvers |
	file ifNil: [^ nil].
	resolvers := {file parent. rootFile parent} withoutDuplicates , paths.
	names := {[fileName]}
		, (extensions collect: [:ext |
			[fileName , ext]]).
	resolvers do: [:resolver |
		names do: [:name | | reference |
			reference := resolver resolve: name value.
			reference exists ifTrue: [^ reference]]].
	^ nil