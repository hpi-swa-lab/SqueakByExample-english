*SBE-Extract-current changeset
newChangesNamed: aString during: aBlock

	| changeSet |
	changeSet := self basicNewChangeSet: aString.
	[^ self newChanges: changeSet during: aBlock]
		ensure: [changeSet destroy]