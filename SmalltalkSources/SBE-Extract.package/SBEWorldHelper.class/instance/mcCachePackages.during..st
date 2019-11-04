utils
mcCachePackages: names during: aBlock

	| cache |
	cache := MCCacheRepository path: (MCCacheRepository default directory fullName , '-' , self name).
	^ MCCacheRepository setDefault: cache during: [ | packages |
		packages := names collect: [:name | MCWorkingCopy forPackageNamed: name].
		packages do: [:package | package
			newVersionWithName: package uniqueVersionName
			message: ''].
		aBlock value]