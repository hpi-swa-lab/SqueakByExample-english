visiting - nodes
visitGenericEnvironment: node

	| begin name options |
	self assert: node children size >= 2.
	begin := node children first.
	self assert: begin sbeType = #begin.
	self assert: begin children size >= 2.
	self assert: begin children second sbeType = #curlyGroupText.
	name := self fullContentsInGroup: begin children second.
	options := #().
	begin children size > 2 ifTrue:
		[| brackGroup |
		brackGroup := begin children detect: [:ea | ea sbeType = #brackGroup].
		options := brackGroup children select: [:ea | ea sbeType = #text]].
	
	self assert:
		(node children last sbeType = #end
			and: [node children last children size >= 2]
			and: [node children last children second sbeType = #curlyGroupText]
			and: [(self fullContentsInGroup: node children last children second) = name]).
	
	^ self handleEnvironment: name options: options during:
		[2 to: node children size - 1 do: [:i |
			self visit: (node children at: i)]]