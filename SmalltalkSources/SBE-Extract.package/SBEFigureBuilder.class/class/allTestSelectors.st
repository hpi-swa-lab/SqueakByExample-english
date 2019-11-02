accessing
allTestSelectors

	^ (self allSelectors select: [:selector |
		(selector beginsWith: #build)
			and: [selector numArgs isZero]]) asSortedArray