test suite
test: aMatcher with: testString expect: expected withSubexpressions: subexpr
	| got |
	Transcript tab; 
		show: 'Matching: ';
		show: testString printString; 
		show: ' expected: '; 
		show: expected printString;
		show: ' got: '.
	got := aMatcher search: testString.
	Transcript show: got printString.
	got asString ~= expected asString
		ifTrue: [^false].
	(subexpr ~= #nil and: [aMatcher supportsSubexpressions])
		ifFalse:
			[^true]
		ifTrue:
			[ | isOK |
			isOK := true.
			1 to: subexpr size by: 2 do: [: i |
				| sub subExpect subGot |
				sub := subexpr at: i.
				subExpect := subexpr at: i + 1.
				subGot := aMatcher subexpression: sub.
				Transcript cr; tab; tab;
					show: 'Subexpression: ', sub printString;
					show: ' expected: ';
					show: subExpect printString;
					show: ' got: ';
					show: subGot printString.
				subExpect ~= subGot
					ifTrue: 
					[Transcript show: ' -- MISMATCH'.
					isOK := false]].
			^isOK]