utils
emptyClass: aClass during: aBlock

	| organization |
	organization := aClass organization.
	aClass organization: (ClassOrganizer defaultList: #()).
	^ aBlock ensure: [
		aClass organization: organization]