accessing
pathToLabel: key

	(self labels includes: key) ifTrue: [^ {self}].
	self children do: [:ea |
		(ea pathToLabel: key) ifNotNil: [:path |
			^ path copyWithFirst: self]].
	^ nil