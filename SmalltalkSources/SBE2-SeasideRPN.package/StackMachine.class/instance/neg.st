operations
neg
	self assert: contents first isNumber.
	self push: self pop negated