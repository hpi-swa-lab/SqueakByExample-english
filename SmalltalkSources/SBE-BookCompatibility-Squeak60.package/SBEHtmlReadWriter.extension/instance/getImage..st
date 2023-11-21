*SBE-BookCompatibility-Squeak60-private
getImage: uri

	(uri beginsWith: 'cid:' caseSensitive: false) ifTrue: [
		"Content-ID, used in nested MIMEDocuments, e.g., for emails with inline images"
		(Smalltalk classNamed: #MIMEContentRequest) ifNotNil: [:class |
			| cid |
			cid := uri allButFirst: 4.
			(class signal: cid) ifNotNil: [:document |
				^ [document image] ifError: [nil]]].
		^ nil].
	
	(uri beginsWith: 'code://' caseSensitive: false) ifTrue: [
		| expression |
		"Same support for Smalltalk expressions as in TextURL >> #actOnClickFor:."
		self shallEvaluateResources ifFalse: [^ nil].
		expression := uri allButFirst: 7.
		^ ([Compiler evaluate: expression] ifError: [nil])
			ifNotNil: [:object | object isForm ifTrue: [object] ifFalse: [nil]]].
	
	(uri beginsWith: 'data:' caseSensitive: false) ifTrue: [ | data mediaType separator |
		separator := uri indexOf: $, ifAbsent: [^ nil].
		mediaType := uri copyFrom: 6 to: separator - 1.
		data := uri allButFirst: separator.
		data := (mediaType endsWith: ';base64' caseSensitive: false)
			ifTrue: [
				mediaType := mediaType allButLast: 7.
				[Base64MimeConverter mimeDecodeToBytes: data readStream] ifError: [nil]]
			ifFalse: [data asByteArray readStream].
		^ [ImageReadWriter formFromStream: data] ifError: [nil]].
	
	self shallDownloadResources ifFalse: [^ nil].
	^ (Smalltalk classNamed: #WebClient) ifNotNil: [:client |
		"Maybe we can have this via an AppRegistry at some point. Maybe extend WebBrowser."
		([client httpGet: uri] ifError: [nil]) ifNotNil: [:response |
			response code = 200 ifFalse: [nil] ifTrue: [
				[Form fromBinaryStream: response content asByteArray readStream]
					ifError: [nil]]]]