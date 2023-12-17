mapping
mapTagToAttribute: aTag

	(self hasTag: aTag name: '<sbeTextAnchor') ifTrue:
		[^ {(self getImage: 'data:image/png;base64,', (self searchTag: aTag forAttribute: 'data'))
			asSbeTextAnchorWithExtent: (Object readFrom: (self searchTag: aTag forAttribute: 'extent'))
			dyeMode: (Object readFrom: (self searchTag: aTag forAttribute: 'dyeMode'))}].
	
	(self hasTag: aTag name: '<sbeTextColor') ifTrue:
		[^ {SBETextColor
			property: (Object readFrom: (self searchTag: aTag forAttribute: 'property'))
			scope: (Object readFrom: (self searchTag: aTag forAttribute: 'scope'))}].
	
	(self hasTag: aTag name: '<sbeTextFontReference') ifTrue:
		[^ {SBETextFontReference style:
			(Object readFrom: (self searchTag: aTag forAttribute: 'style'))}].
	
	(self hasTag: aTag name: '<sbeTextLabelAnchor') ifTrue:
		[^ {SBETextLabelAnchor label: (self searchTag: aTag forAttribute: ' label')}].
	
	(self hasTag: aTag name: '<sbeTextLabelLink') ifTrue:
		[^ {SBETextLabelLink to: (self searchTag: aTag forAttribute: ' label')}].
	
	(self hasTag: aTag name: '<sbeTextOpenImage') ifTrue:
		[^ {SBETextOpenImageAction
			for: (self getImage: 'data:image/png;base64,', (self searchTag: aTag forAttribute: 'data'))
			initialExtent: (Object readFrom: (self searchTag: aTag forAttribute: 'initialExtent'))}].
	
	^ super mapTagToAttribute: aTag