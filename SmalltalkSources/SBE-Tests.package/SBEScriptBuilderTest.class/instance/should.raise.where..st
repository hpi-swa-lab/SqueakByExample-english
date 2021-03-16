accessing
should: aBlock raise: anException where: aPredicate

	^ self assert: (self executeShould: aBlock inScopeOf: anException where: aPredicate)