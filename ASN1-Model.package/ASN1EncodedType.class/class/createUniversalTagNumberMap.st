as yet unclassified
createUniversalTagNumberMap
	^ (Dictionary new: 8)
		at: 'BOOLEAN' put: 1;
		at: 'INTEGER' put: 2;
		at: 'BIT STRING' put: 3;
		at: 'OCTET STRING' put: 4;
		at: 'NULL' put: 5;
		at: 'OBJECT IDENTIFIER' put: 6;

		at: 'EXTERNAL' put: 8;
		at: 'ENUMERATED' put: 10;
		at: 'SEQUENCE' put: 16;
		at: 'PrintableString' put: 19;
		at: 'TeletexString' put: 20;
		at: 'UTCTime' put: 23;
		yourself.