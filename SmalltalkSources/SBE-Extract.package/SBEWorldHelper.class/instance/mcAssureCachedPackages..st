utils
mcAssureCachedPackages: names

	names
		collect: [:name | MCWorkingCopy forPackageNamed: name]
		thenDo: [:package | package
			newVersionWithName: package uniqueVersionName
			message: ''].