initialize-release
sourceLines: anObject
	"Here we translate special characters in the LaTeX source.
	For now we only have to worry about BANG = !"
	sourceLines := anObject collect: [:line |
			line copyWithRegex: 'BANG' matchesReplacedWith: '!'.
			line copyWithRegex: 'CARET' matchesReplacedWith: '^'.
			].
	self chapter generateTestMethod: self testSource