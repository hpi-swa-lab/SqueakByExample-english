saving
writeScene: aScene to: aFileString

	aScene
		buildWith: worldHelper;
		saveAs: (self fileDirectory resolve: aFileString).