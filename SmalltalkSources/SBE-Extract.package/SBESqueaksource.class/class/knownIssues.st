as yet unclassified
knownIssues
	self flag: #todos.
	"
	* At least I (ct) had problems writing to the Squeaksource, so I temporarily enabled global write access for writing
	* Version numbers are not always monotonically incremented. Not sure why this is, but deleting the files from the package cache and unloading the packages from the image helped me to reset most of the version numbers.
	* Might automate this later as part of the CI
	* Add support for upcoming editions in the future
	"