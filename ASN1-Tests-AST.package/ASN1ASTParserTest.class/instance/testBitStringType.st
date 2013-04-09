tests
testBitStringType
	| parsed |
	parsed := self parse: 'BIT STRING {
        msc-s (0),
        mgw (1),
        sgsn (2),
        ggsn (3)}' rule: #bitStringType.
	self assert: (parsed bits size = 4).
	self assert: (parsed bits first name = 'msc-s')