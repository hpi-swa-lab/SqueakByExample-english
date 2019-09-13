fixture
makeFixture
	"self new makeFixture"
	| about aboutSPE homeDir |
	self cleanFixture.
	
	homeDir := self mkdir: self webDirName in: FileDirectory default.
	self createPage: 'index.html'
		title: 'Squeak By Example -- Home Page'
		contents: '<a href="About/index.html">Squeak by Example</a> is a great book.
There is also a <a href="spe.html">french translation</a>'
		in: homeDir.
	self createPage: 'spe.html'
		title: 'Squeak Par L''Exemple -- Home Page'
		contents: '<a href="AboutSPE/index.html">Squeak Par L''Exemple</a> is a great book.
There is also an <a href="index.html">english translation</a>'
		in: homeDir.
	self createPage: 'junk.xml'
		title: 'File to be ignored'
		contents: 'This is not an html file and should be ignored'
		in: homeDir.

	about := self mkdir: 'About' in: homeDir.
	self createPage: 'index.html'
		title: 'About Squeak by Example'
		contents: 'You can find out more about Squeak by Example <a href="../index.html">here</a>'
		in: about.


	aboutSPE := self mkdir: 'AboutSPE' in: homeDir.
	self createPage: 'index.html'
		title: 'About Squeak Par L''Exemple'
		contents: 'You can find out more about Squeak Par L''Exemple <a href="../index.html">here</a>'
		in: aboutSPE.

	^ WebDir onDir: homeDir
