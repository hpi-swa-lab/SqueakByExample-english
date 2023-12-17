accessing
addChild: aBookNode

	^ self children addLast:
		(aBookNode
			parent: self;
			yourself)