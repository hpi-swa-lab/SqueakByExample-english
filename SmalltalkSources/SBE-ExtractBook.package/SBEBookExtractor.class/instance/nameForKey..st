private
nameForKey: key

	#('cha:' 'sec:' 'app:' 'fig:' 'tab:' 'mth:' 'cls:' 'rule:') do: [:prefix |
		((key beginsWith: prefix) and: [key size > prefix size])
			ifTrue: [^ key allButFirst: prefix size]].
	
	(key beginsWith: 'reftoind:') ifTrue:
		[(self book pathToLabel: key) ifNotNil: [:path |
			^ (path select: [:node | node wantsOwnHelpTopic]) last title]].
	
	^ super nameForKey: key