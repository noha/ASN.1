tests
testEncodeGeneralizedTime
	self assert: (ASN1GeneralizedTimeType encode: (DateAndTime epoch + (Duration nanoSeconds: 123456000 ))) = '19010101000000.123456Z'.
	self assert: (ASN1GeneralizedTimeType encode: ((DateAndTime epoch + (Duration nanoSeconds: 123456000 )) offset: 2 hours)) = '19010101020000.123456+0200'
