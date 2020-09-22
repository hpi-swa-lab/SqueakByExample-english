code generation - constants
nameForBuilderScript: script

	| idToken idString |
	idToken := script findTokens
		detect: [:token |
			#('''''' '""') includes: ({token first. token last} as: String)].
	idString := idToken allButFirst allButLast.
	"Heuristic"
	(['(\./)?figures/(.*)\.png' asRegex] once submatchesIn: idString)
		ifNotEmpty: [:matches | idString := matches anyOne last].
	^ self
		uniqueNameFrom: 'build' , (idString asIdentifier: true)
		lest: [:nextName | self canUnderstand: nextName]