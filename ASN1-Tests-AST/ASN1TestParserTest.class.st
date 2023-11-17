Class {
	#name : #ASN1TestParserTest,
	#superclass : #PPCompositeParserTest,
	#category : 'ASN1-Tests-AST'
}

{ #category : #testing }
ASN1TestParserTest >> expectedFailures [ 
	^ #( testFooDoubleToken )
]

{ #category : #accessing }
ASN1TestParserTest >> parserClass [ 
	^ ASN1TestParser 
]

{ #category : #tests }
ASN1TestParserTest >> testFoo [
	self parse: 'foo' rule: #foo.
	self fail: 'foo ' rule: #foo
]

{ #category : #tests }
ASN1TestParserTest >> testFooDoubleToken [
	"double token invokes two times the token parser. Double usage of token parser leads 
	to a space character at the end of the token"
	self parse: 'foo' rule: #fooDoubleToken.
	self assert: (self parse: 'foo ' rule: #fooDoubleToken) value = 'foo'
]

{ #category : #tests }
ASN1TestParserTest >> testFooToken [
	self parse: 'foo' rule: #fooToken.
	self assert: (self parse: 'foo ' rule: #fooToken) value = 'foo'
]
