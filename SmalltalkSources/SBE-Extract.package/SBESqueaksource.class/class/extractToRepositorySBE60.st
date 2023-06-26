extracting
extractToRepositorySBE60

	^ self extractToRepository:
		(MCRepositoryGroup default repositories
			detect: [:each | each description = 'http://www.squeaksource.com/SqueakByExample60'])