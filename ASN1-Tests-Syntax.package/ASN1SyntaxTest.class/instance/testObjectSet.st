tests
testObjectSet
	self parse: '{a | b | c}' rule: #objectSet.
	self parse: '{ ... }' rule: #objectSet.
	self parse: '{ a | b | c, ..., d | e | f }' rule: #objectSet.
