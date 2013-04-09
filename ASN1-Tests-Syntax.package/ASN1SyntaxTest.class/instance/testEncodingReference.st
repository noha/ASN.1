tests
testEncodingReference
	self parse: 'ABC:' rule: #encodingReference.
	self parse: 'FOO-3BAR:' rule: #encodingReference.
	self parse: '' rule: #encodingReference.
	self fail: 'AbC:' rule: #encodingReference.
	self fail: 'A3D-4d:' rule: #encodingReference.
	self fail: 'ABC-:' rule: #encodingReference.
