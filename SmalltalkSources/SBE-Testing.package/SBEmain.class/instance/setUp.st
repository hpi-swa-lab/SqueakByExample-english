initialize-release
setUp

	SystemChangeNotifier uniqueInstance doSilently: [
		self class removeOldTestCategory.
		chapters := OrderedCollection new.
		self getChapters].