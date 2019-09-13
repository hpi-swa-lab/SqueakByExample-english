querying
webPages
	"Return the web pages in this web dir (but not those in subdirectories)"
	^ self htmlFiles collect: 
		[ :each | 
		WebPage 
			on: webDir pathName, '/', each
			forHome: homePath ]