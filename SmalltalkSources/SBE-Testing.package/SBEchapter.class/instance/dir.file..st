initialize-release
dir: dirName file: fileName
	dir := dirName.
	file := fileName.
	[self openChapterStream.
	self findTests] ensure: [
		self closeChapterStream].