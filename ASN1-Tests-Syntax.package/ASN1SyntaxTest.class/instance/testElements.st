tests
testElements
	self parse: '1..2' rule: #elements.
	self parse: '( updateLocation | fooBar )' rule: #elements.

