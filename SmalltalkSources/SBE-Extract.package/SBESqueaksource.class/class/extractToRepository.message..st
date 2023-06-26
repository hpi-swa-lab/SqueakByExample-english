extracting
extractToRepository: aMCRepository message: message

	aMCRepository cacheAllFileNamesDuring: [
		self packageNames do: [:packageName |
			| workingCopy version |
			workingCopy := MCWorkingCopy forPackage: (MCPackage new name: packageName).
			self assert: (workingCopy possiblyNewerVersionsIn: aMCRepository) isEmpty.
			version := [workingCopy newVersion]
				on: MCRepositoryRequest
				do: [:req | req resume: aMCRepository]
				on: MCVersionNameAndMessageRequest
				do: [:req | req resumeMessage: message].
			aMCRepository storeVersion: version]].