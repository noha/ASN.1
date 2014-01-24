tests
testValueSetResolution
	| parsed |
	parsed := self parse: '{updateLocation | cancelLocation | purgeMS }' rule: #valueSet.
	self assert: parsed elementsSpec elements size = 3.
	parsed := self parse: '{updateLocation | cancelLocation | purgeMS, ...}' rule: #valueSet.
	self assert: parsed elementsSpec elements size = 4.
	parsed := self parse: '{updateLocation | cancelLocation | purgeMS, ..., prepareHandover | sendEndSignal }' rule: #valueSet.
	self assert: parsed elementsSpec elements size = 6