private
specialCharacters

	^ OrderedDictionary new
		at: '~' put: (String value: 16rA0);
		at: '``' put: '"';
		at: '''''' put: '"';
		at: '`' put: '''';
		at: '>>>' put: '»';
		yourself