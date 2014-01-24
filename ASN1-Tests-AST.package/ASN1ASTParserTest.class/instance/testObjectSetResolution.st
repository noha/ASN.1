tests
testObjectSetResolution
	| parsed |
	parsed := self parse: '{ a | b | c, ..., d | e | f }' rule: #objectSet.
	self assert: parsed elementsSpec elements size = 7.
