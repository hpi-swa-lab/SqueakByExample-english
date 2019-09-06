operations
rotUp
	(self size <= 1) ifTrue: [ ^ self ].
	contents addLast: contents removeFirst.