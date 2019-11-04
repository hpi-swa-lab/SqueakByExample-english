*SBE-Extract-identification
setAuthorInitials: aString during: aBlock

	| previous |
	previous := AuthorInitials.
	self authorInitials: aString.
	^ aBlock ensure: [AuthorInitials := previous]