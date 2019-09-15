fixture
createPage: fileName title: title contents: contents in: dir
	"Create dummy web page for testing"
	| page |
	page := dir forceNewFileNamed: fileName.
	page
		nextPutAll: self head;
		nextPutAll: title;
		nextPutAll: self middle;
		nextPutAll: contents;
		nextPutAll: self tail;
		close.