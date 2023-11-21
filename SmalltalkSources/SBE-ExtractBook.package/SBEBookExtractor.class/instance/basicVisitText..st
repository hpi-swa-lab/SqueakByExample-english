visiting - nodes
basicVisitText: aString

	(aString caseOf: {['\chapter'] -> [#chapter]. ['\section'] -> [#section]} otherwise: []) "work around some other grammar slips ..."
		ifNotNil: [:type |
			parseStack push:
				(Generator on: [:gen |
					self assert: gen next isNil. "whyever"
					
					DCBlock new
						type: type;
						addMorphBack:
							(DCText new contents: aString; yourself);
						addMorphBack:
							gen peek;
						sbeVisit: self]).
			^ self].
	
	pendingLabels ifNotEmpty:
		[aString ifNotEmpty:
			[| currentLabels |
			currentLabels := pendingLabels copy.
			pendingLabels removeAll.
			self basicVisitText: aString first asString.
			currentLabels do: [:label |
				self emitLabel: label].
			self basicVisitText: aString allButFirst.
			^ self]].
	
	^ super basicVisitText: aString