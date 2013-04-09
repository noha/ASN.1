tests
testFooDoubleToken
	"double token invokes two times the token parser. Double usage of token parser leads 
	to a space character at the end of the token"
	self parse: 'foo' rule: #fooDoubleToken.
	self assert: (self parse: 'foo ' rule: #fooDoubleToken) value = 'foo'