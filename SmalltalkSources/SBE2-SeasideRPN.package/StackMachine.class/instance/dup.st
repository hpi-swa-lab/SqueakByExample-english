operations
dup
	self assert: contents size > 0.
	contents addFirst: contents first.