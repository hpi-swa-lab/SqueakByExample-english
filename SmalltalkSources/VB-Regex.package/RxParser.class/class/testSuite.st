test suite
testSuite
	"Answer an array of test clauses. Each clause is an array with a regex source
	string followed by sequence of 3-tuples. Each three-element
	group is one test to try against the regex, and includes: 1) test string;
	2) expected result; 3) expected subexpression as an array of (index, substring), 
	or nil.
	The test suite is based on the one in Henry Spencer's regexp.c package."
	^#(
		('abc'
			'abc' true (1 'abc')
			'xbc' false nil
			'axc' false nil
			'abx' false nil
			'xabcy' true (1 'abc')
			'ababc' true (1 'abc'))
		('ab*c'
			'abc' true (1 'abc'))
		('ab*bc'
			'abc' true (1 'abc')
			'abbc' true (1 'abbc')
			'abbbbc' true (1 'abbbbc'))
		('ab+bc'	
			'abbc' true (1 'abbc')
			'abc' false nil
			'abq' false nil
			'abbbbc' true (1 'abbbbc'))
		('ab?bc'
			'abbc' true (1 'abbc')
			'abc' true (1 'abc')
			'abbbbc' false nil
			'abc' true (1 'abc'))
		('^abc$'
			'abc' true (1 'abc')
			'abcc' false nil
			'aabc' false nil)
		('^abc'
			'abcc' true (1 'abc'))
		('abc$'
			'aabc' true (1 'abc'))
		('^'
			'abc' true nil)
		('$'
			'abc' true nil)
		('a.c'
			'abc' true (1 'abc')
			'axc' true (1 'axc'))
		('a.*c'	
			'axyzc' true (1 'axyzc')
			'axy zc' true (1 'axy zc') "testing that a dot matches a space"
			'axy
						 zc' false nil "testing that a dot does not match a newline"
			'axyzd' false nil)
		('.a.*'
			'1234abc' true (1 '4abc')
			'abcd' false nil)
		('a\w+c'
			' abbbbc ' true (1 'abbbbc')
			'abb bc' false nil)
		('\w+'
			'  	foobar	quux' true (1 'foobar')
			' 	~!@#$%^&*()-+=\|/?.>,<' false nil)
		('a\W+c'
			'a   c' true (1 'a   c')
			'a bc' false nil)
		('\W+'
			'foo!@#$bar' true (1 '!@#$')
			'foobar' false nil)
		('a\s*c'
			'a   c' true (1 'a   c')
			'a bc' false nil)
		('\s+'
			'abc3457 sd' true (1 ' ')
			'1234$^*^&asdfb' false nil)
		('a\S*c'
			'aqwertyc' true (1 'aqwertyc')
			'ab c' false nil)
		('\S+'
			'     	asdf		' true (1 'asdf')
			' 	
				' false nil)
		('a\d+c'
			'a0123456789c' true (1 'a0123456789c')
			'a12b34c' false nil)
		('\d+'
			'foo@#$%123ASD #$$%^&' true (1 '123')
			'foo!@#$asdfl;' false nil)
		('a\D+c'
			'aqwertyc' true (1 'aqwertyc')
			'aqw6ertc' false nil)
		('\D+'
			'1234 abc 456' true (1 ' abc ')
			'1234567890' false nil)
		('(f|o)+\b'
			'foo' true (1 'foo')
			' foo ' true (1 'foo'))
		('\ba\w+' "a word beginning with an A"
			'land ancient' true (1 'ancient')
			'antique vase' true (1 'antique')
			'goofy foobar' false nil)
		('(f|o)+\B'
			'quuxfoobar' true (1 'foo')
			'quuxfoo ' true (1 'fo'))
		('\Ba\w+' "a word with an A in the middle, match at A and further"
			'land ancient' true (1 'and')
			'antique vase' true (1 'ase')
			'smalltalk shall overcome' true (1 'alltalk')
			'foonix is better' false nil)
		('fooa\>.*'
			'fooa ' true nil
			'fooa123' false nil
			'fooa bar' true nil
			'fooa' true nil
			'fooargh' false nil)
		('\>.+abc'
			' abcde fg' false nil
			'foo abcde' true (1 ' abc')
			'abcde' false nil)
		('\<foo.*'
			'foo' true nil
			'foobar' true nil
			'qfoobarq foonix' true (1 'foonix')
			' foo' true nil
			' 12foo' false nil
			'barfoo' false nil)
		('.+\<foo'
			'foo' false nil
			'ab foo' true (1 'ab foo')
			'abfoo' false nil)
		('a[bc]d'
			'abc' false nil
			'abd' true (1 'abd'))
		('a[b-d]e'
			'abd' false nil
			'ace' true (1 'ace'))
		('a[b-d]'
			'aac' true (1 'ac'))
		('a[-b]'
			'a-' true (1 'a-'))
		('a[b-]'
			'a-' true (1 'a-'))
		('a[a-b-c]' nil)
		('[k]'
			'ab' false nil)
		('a[b-a]' nil)
		('a[]b' nil)
		('a[' nil)
		('a]' 
			'a]' true (1 'a]'))
		('a[]]b'
			'a]b' true (1 'a]b'))
		('a[^bc]d'
			'aed' true (1 'aed')
			'abd' false nil)
		('a[^-b]c'
			'adc' true (1 'adc')
			'a-c' false nil)
		('a[^]b]c'
			'a]c' false nil
			'adc' true (1 'adc'))
		('[\de]+'
			'01234' true (1 '01234')
			'0123e456' true (1 '0123e456')
			'0123e45g78' true (1 '0123e45'))
		('[e\d]+' "reversal of the above, should be the same"
			'01234' true (1 '01234')
			'0123e456' true (1 '0123e456')
			'0123e45g78' true (1 '0123e45'))
		('[\D]+'
			'123abc45def78' true (1 'abc'))
		('[[:digit:]e]+'
			'01234' true (1 '01234')
			'0123e456' true (1 '0123e456')
			'0123e45g78' true (1 '0123e45'))
		('[\s]+'
			'2  spaces' true (1 '  '))
		('[\S]+'
			'  word12!@#$  ' true (1 'word12!@#$'))
		('[\w]+'
			' 	foo123bar	45' true (1 'foo123bar'))
		('[\W]+'
			'fii234!@#$34f' true (1 '!@#$'))
		('[^[:alnum:]]+'
			'fii234!@#$34f' true (1 '!@#$'))
		('[%&[:alnum:]]+'
			'foo%3' true (1 'foo%3')
			'foo34&rt4$57a' true (1 'foo34&rt4')
			'!@#$' false nil)
		('[[:alpha:]]+'
			' 123foo3 ' true (1 'foo')
			'123foo' true (1 'foo')
			'foo1b' true (1 'foo'))
		('[[:cntrl:]]+'
			' a 1234asdf' false nil)
		('[[:lower:]]+'
			'UPPERlower1234' true (1 'lower')
			'lowerUPPER' true (1 'lower'))
		('[[:upper:]]+'
			'UPPERlower1234' true (1 'UPPER')
			'lowerUPPER ' true (1 'UPPER'))
		('[[:space:]]+'
			'2  spaces' true (1 '  '))
		('[^[:space:]]+'
			'  word12!@#$  ' true (1 'word12!@#$'))
		('[[:graph:]]+'
			'abc' true (1 'abc'))
		('[[:print:]]+'
			'abc' true (1 'abc'))
		('[^[:punct:]]+'
			'!hello,world!' true (1 'hello'))
		('[[:xdigit:]]+'
			'  x10FCD  ' true (1 '10FCD')
			' hgfedcba0123456789ABCDEFGH '
				true (1 'fedcba0123456789ABCDEF'))
		('ab|cd'
			'abc' true (1 'ab')
			'abcd' true (1 'ab'))
		('()ef'
			'def' true (1 'ef' 2 ''))
		('()*' nil)
		('*a' nil)
		('^*' nil)
		('$*' nil)
		('(*)b' nil)
		('$b'	'b' false nil)
		('a\' nil)
		('a\(b'
			'a(b' true (1 'a(b'))
		('a\(*b'
			'ab' true (1 'ab')
			'a((b' true (1 'a((b'))
		('a\\b'
			'a\b' true (1 'a\b'))
		('abc)' nil)
		('(abc' nil)
		('((a))'
			'abc' true (1 'a' 2 'a' 3 'a'))
		('(a)b(c)'
			'abc' true (1 'abc' 2 'a' 3 'c'))
		('a+b+c'
			'aabbabc' true (1 'abc'))
		('a**' nil)
		('a*?' nil)
		('(a*)*' nil)
		('(a*)+' nil)
		('(a|)*' nil)
		('(a*|b)*' nil)
		('(a+|b)*'
			'ab' true (1 'ab' 2 'b'))
		('(a+|b)+'
			'ab' true (1 'ab' 2 'b'))
		('(a+|b)?'
			'ab' true (1 'a' 2 'a'))
		('[^ab]*'
			'cde' true (1 'cde'))
		('(^)*' nil)
		('(ab|)*' nil)
		(')(' nil)
		('' 'abc' true (1 ''))
		('abc' '' false nil)
		('a*'
			'' true '')
		('abcd'
			'abcd' true (1 'abcd'))
		('a(bc)d'
			'abcd' true (1 'abcd' 2 'bc'))
		('([abc])*d'
			'abbbcd' true (1 'abbbcd' 2 'c'))
		('([abc])*bcd'
			'abcd' true (1 'abcd' 2 'a'))
		('a|b|c|d|e' 'e' true (1 'e'))
		('(a|b|c|d|e)f' 'ef' true (1 'ef' 2 'e'))
			"	((a*|b))*	-	c	-	-"
		('abcd*efg' 'abcdefg' true (1 'abcdefg'))
		('ab*' 
			'xabyabbbz' true (1 'ab')
			'xayabbbz' true (1 'a'))
		('(ab|cd)e' 'abcde' true (1 'cde' 2 'cd'))
		('[abhgefdc]ij' 'hij' true (1 'hij'))
		('^(ab|cd)e' 'abcde' false nil)
		('(abc|)def' 'abcdef' true nil)
		('(a|b)c*d' 'abcd' true (1 'bcd' 2 'b'))
		('(ab|ab*)bc' 'abc' true (1 'abc' 2 'a'))
		('a([bc]*)c*' 'abc' true (1 'abc' 2 'bc'))
		('a([bc]*)(c*d)' 'abcd' true (1 'abcd' 2 'bc' 3 'd'))
		('a([bc]+)(c*d)' 'abcd' true (1 'abcd' 2 'bc' 3 'd'))
		('a([bc]*)(c+d)' 'abcd' true (1 'abcd' 2 'b' 3 'cd'))
		('a[bcd]*dcdcde' 'adcdcde' true (1 'adcdcde'))
		('a[bcd]+dcdcde' 'adcdcde' false nil)
		('(ab|a)b*c' 'abc' true (1 'abc'))
		('((a)(b)c)(d)' 'abcd' true (1 'abcd' 3 'a' 4 'b' 5 'd'))
		('[ -~]*' 'abc' true (1 'abc'))
		('[ -~ -~]*' 'abc' true (1 'abc'))
		('[ -~ -~ -~]*' 'abc' true (1 'abc'))
		('[ -~ -~ -~ -~]*' 'abc' true (1 'abc'))
		('[ -~ -~ -~ -~ -~]*' 'abc' true (1 'abc'))
		('[ -~ -~ -~ -~ -~ -~]*' 'abc' true (1 'abc'))
		('[ -~ -~ -~ -~ -~ -~ -~]*' 'abc' true (1 'abc'))
		('[a-zA-Z_][a-zA-Z0-9_]*' 'alpha' true (1 'alpha'))
		('^a(bc+|b[eh])g|.h$' 'abh' true (1 'bh' 2 ''))
		('(bc+d$|ef*g.|h?i(j|k))' 
			'effgz' true (1 'effgz' 2 'effgz' 3 '')
			'ij' true (1 'ij' 2 'ij' 3 'j')
			'effg' false nil
			'bcdd' false nil
			'reffgz' true (1 'effgz' 2 'effgz' 3 ''))
		('(((((((((a)))))))))' 'a' true (1 'a'))
		('multiple words of text' 
			'uh-uh' false nil
			'multiple words of text, yeah' true (1 'multiple words of text'))
		('(.*)c(.*)' 'abcde' true (1 'abcde' 2 'ab' 3 'de'))
		('\((.*), (.*)\)' '(a, b)' true (2 'a' 3 'b')))