initialize-release
setUp
	"SBEmain new setUp"

	SystemChangeNotifier uniqueInstance doSilently: [
		self class removeOldTestCategory.
		chapters := OrderedCollection new.
		self getChapters].