private
unescapeLatex: latexString
	"Custom latex commands are not supported here!"

	| matcher |
	matcher := '\\([\\#\{\}\[\]])' asRegex.
	^ matcher
		copy: latexString
		translatingMatchesUsing: [:match | matcher subexpression: 2]