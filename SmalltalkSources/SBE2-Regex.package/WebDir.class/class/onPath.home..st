instance creation
onPath: path home: homePath
	"return a subdirectory of a webdir with a given home path"
	^ self new setDir: (FileDirectory on: path) home: homePath