printing
printOn: aStream 
	"Return a self-evaluating representation."
	aStream
		nextPutAll: self class name;
		nextPutAll: ' on: ';
		nextPutAll: path printString;
		nextPutAll: ' for ';
		nextPutAll: homePath printString