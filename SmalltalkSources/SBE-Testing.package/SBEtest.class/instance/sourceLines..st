initialize-release
sourceLines: anObject
	"Here we translate special characters in the LaTeX source. See also comment in #escapeSequences."

	| matcher |
	self flag: #NB. "This is not fully compatible with escaping inside the source nor with patterns spanning over multiple lines, implement this when you really need it ..."
	
	matcher := '!\s*\\SqVersionSwitch\{([\w.]+)\}\{((\\[{}]|[^{}])+)\}\{((\\[{}]|[^{}])+)\}\s*!' asRegex.
	sourceLines := anObject collect: [:line |
		matcher
			copy: (self escapeSequences
				inject: line
				into: [:result :escape |
					result copyWithRegex: escape key matchesReplacedWith: escape value])
			translatingMatchesUsing: [:match |
				(matcher subexpression: 1) >= self systemVersionString
					ifTrue: [matcher subexpression: 2]
					ifFalse: [matcher subexpression: 4]]].
	
	self chapter generateTestMethod: self testSource.