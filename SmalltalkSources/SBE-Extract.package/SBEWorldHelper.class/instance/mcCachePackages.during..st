utils
mcCachePackages: names during: aBlock

	| directory cache |
	directory := FileDirectory on: MCCacheRepository default directory fullName
		, '-' , self name.
	directory assureAbsence; assureExistence.
	cache := MCCacheRepository path: directory fullName.
	^ MCCacheRepository setDefault: cache during: [ | packages |
		packages := names collect: [:name | MCWorkingCopy forPackageNamed: name].
		packages
			collect: [:package | package
				newVersionWithName: package uniqueVersionName
				message: '']
			thenDo: [:version | cache storeVersion: version].
		aBlock value]