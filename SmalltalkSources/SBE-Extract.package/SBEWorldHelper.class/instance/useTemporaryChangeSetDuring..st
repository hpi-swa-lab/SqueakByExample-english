private utils
useTemporaryChangeSetDuring: aBlock

	^ ChangeSet
		newChangesNamed: 'Temporary changeset for SBE recording'
		during: aBlock