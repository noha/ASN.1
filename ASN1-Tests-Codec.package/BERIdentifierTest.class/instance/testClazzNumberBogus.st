as yet unclassified
testClazzNumberBogus
	self should: [ (ASN1Tag clazz: 'ABC' number: 10) clazzIdentifier ] raise: Error