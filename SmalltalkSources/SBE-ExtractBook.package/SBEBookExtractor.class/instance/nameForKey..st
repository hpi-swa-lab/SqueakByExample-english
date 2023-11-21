private
nameForKey: key

	#('cha:' 'sec:' 'app:' 'fig:' 'tab:' 'mth:' 'cls:' 'rule:') do: [:prefix |
		((key beginsWith: prefix) and: [key size > prefix size])
			ifTrue: [^ key allButFirst: prefix size]].
	^ super nameForKey: key