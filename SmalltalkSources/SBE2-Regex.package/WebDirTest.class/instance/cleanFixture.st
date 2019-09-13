fixture
cleanFixture
	"self new cleanFixture"
	
	(FileDirectory default directoryExists: self webDirName)
		ifTrue: [ (FileDirectory default directoryNamed: self webDirName) recursiveDelete ]