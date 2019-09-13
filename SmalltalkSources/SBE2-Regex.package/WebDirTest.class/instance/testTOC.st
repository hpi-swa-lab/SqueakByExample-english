running
testTOC
	self assert: [ home allHtmlFiles size = 4 ].

	home makeToc.
	self assert: [ home allHtmlFiles size = 5 ].
	
	"Here we should test the contents of toc.html ..."

	home removeToc.
	self assert: [ home allHtmlFiles size = 4 ].