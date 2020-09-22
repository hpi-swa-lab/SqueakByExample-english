*SBE-Extract-container protocol
openPathMatching: anItemMatchArray 

	^ self openPathWhere: (anItemMatchArray collect: [:match | [:item | match matches: item asString]])