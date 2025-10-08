visiting - commands
commandLstSet: arguments
	<command: 'lstset'>

	| options |
	self assert: arguments size = 1.
	options := self mapFromGroup: arguments first.
	
	options at: 'caption' ifPresent: [:nodes |
		self emitCaptionDuring:
			[nodes do: [:node |
				self visit: node]].
		self basicVisitLineBreak: nil; basicVisitLineBreak: nil].
	options at: 'label' ifPresent: [:nodes |
		| key |
		self assert: nodes first sbeType = #curlyGroup.
		key := (self contentsIn: nodes first) asString.
		self emitLabel: key].