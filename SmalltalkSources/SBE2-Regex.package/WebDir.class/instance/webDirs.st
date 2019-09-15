querying
webDirs
	"Return the subdirectories of this webdir"
	^ webDir directoryNames collect: [ :each | WebDir onPath: webDir pathName , '/' , each home: homePath ]