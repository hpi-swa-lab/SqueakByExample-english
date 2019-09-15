instance creation
selectHome
	"Prompt the user to select the home directory."
	^ self onDir: FileList2 modalFolderSelector