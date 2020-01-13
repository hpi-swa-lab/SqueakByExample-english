*SBE-Extract-accessing
handles

	| handles |
	handles := Dictionary new.
	self submorphsDo: [:morph |
		(morph eventHandler notNil
			and: [morph eventHandler allRecipients includes: self])
				ifTrue: [handles
						at: (morph eventHandler mouseDownSelector
							ifNil: [morph eventHandler mouseUpSelector])
						put: morph]].
	^ handles