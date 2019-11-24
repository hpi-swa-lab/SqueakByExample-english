private
performTest

	FileSystem disk changeDirectory: self targetDirectory path during: [
		^ super performTest].