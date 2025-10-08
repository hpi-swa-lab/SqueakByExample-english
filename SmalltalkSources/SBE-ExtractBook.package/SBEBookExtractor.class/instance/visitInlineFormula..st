visiting - nodes
visitInlineFormula: node

	verbatim ifTrue: [^ super visitInlineFormula: node].
	
	^ self emitEmphasisDuring:
		[super visitInlineFormula: node]