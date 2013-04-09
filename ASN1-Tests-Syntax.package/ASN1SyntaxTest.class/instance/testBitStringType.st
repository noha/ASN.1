tests
testBitStringType
	self parse: 'BIT STRING {
        msc-s (0),
        mgw (1),
        sgsn (2),
        ggsn (3),
        rnc (4),
        bm-sc (5) ,
        mme (6),
        sgw (7),
        pgw (8),
        eNB (9)}' rule: #bitStringType.
	