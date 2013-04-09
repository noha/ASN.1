tests
testIdentifier
	self parse: 'a' rule: #identifier.
	self parse: 'local' rule: #identifier.
	self parse: 'abc' rule: #identifier.
	self parse: 'aBc-def' rule: #identifier.
	self parse: 'abc-Def34' rule: #identifier.
	self parse: 'b-A' rule: #identifier.
	self fail: '' rule: #identifier.
	self fail: 'Abc' rule: #identifier.
	self fail: 'abc-def-' rule: #identifier.
	self flag: #needsThinking.
	"this test fails if identifiers are parsed as tokens. This introduces the possibility that a 
	-- is treated as the start of a comment which prevents to token parser to fail. From the
	standard it reads as this is exactly the case why -- is forbidden. So we should be safe
	here"
	"self fail: 'abc--def' rule: #identifier."
	self fail: 'local:' rule: #identifier.
	
	self assert: (self parse: 'abc-Def34' rule: #identifier) value = 'abc-Def34'