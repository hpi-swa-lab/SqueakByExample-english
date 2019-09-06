fixture
mkdir: dirName in: dir
	"Create dummy subdirectory for testing"
	dir createDirectory: dirName.
	^ dir directoryNamed: dirName