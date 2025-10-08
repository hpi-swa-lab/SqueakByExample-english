visiting - nodes
visitPlaceholder: node

	| index ref valueAndHereArgs value hereArgs |
	self assert: node children size = 1.
	ref := node children first contents.
	self assert: ref first = $#.
	index := ref allButFirst asNumber.
	commandArguments ifNil:
		[self notify: 'access to parameter outside of command'.
		^ self basicVisitText: ref].
	valueAndHereArgs := commandArguments at: index ifAbsent:
		["self notify: 'illegal parameter number'.
		^ self basicVisitText: ref allButFirst"
		self flag: #todo. "assert that index <= argc"
		^ self].
	value := valueAndHereArgs first.
	hereArgs := valueAndHereArgs second.
	^ self withCommandArguments: hereArgs do:
		[self visit: value]