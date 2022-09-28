accessing
escapeSequences
	"Derived from common.tex / '\lstdefinelanguage{Smalltalk}' / #literate.
	See also: https://regex101.com/r/AhPIe5/1"

	^ {
		'BANG' -> '!'.
		'CARET' -> '^'.
		'UNDERSCORE'-> '_'.
		'\\st' -> 'Smalltalk'.
		'\\#' -> '#'
	}		