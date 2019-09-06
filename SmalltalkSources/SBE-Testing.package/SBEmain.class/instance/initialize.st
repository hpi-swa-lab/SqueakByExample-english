initialize-release
initialize
	self class removeOldTestCategory.
	chapters := OrderedCollection new.
	self getChapters