visiting - nodes
basicVisitText: aStringOrText

	(aStringOrText caseOf: {['\chapter'] -> [#chapter]. ['\section'] -> [#section]} otherwise: []) "work around some other grammar slips ..."
		ifNotNil: [:type |
			parseStack push:
				(Generator on: [:gen |
					self assert: gen next isNil. "whyever"
					
					DCBlock new
						type: type;
						addMorphBack:
							(DCText new contents: aStringOrText asString; yourself);
						addMorphBack:
							gen peek;
						sbeVisit: self]).
			^ self].
	
	pendingLabels ifNotEmpty:
		[aStringOrText ifNotEmpty:
			[| currentLabels |
			currentLabels := pendingLabels copy.
			pendingLabels removeAll.
			self stream
				withAttributes:
					(aStringOrText isText
						ifTrue: [aStringOrText attributesAt: 1]
						ifFalse: [#()])
				do:
					[self basicVisitText: aStringOrText first asString].
			currentLabels do: [:label |
				self emitLabel: label].
			self basicVisitText: aStringOrText allButFirst.
			^ self]].
	
	^ super basicVisitText: aStringOrText