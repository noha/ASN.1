tests
testDecodeGeneralizedTime
	self assert: (ASN1GeneralizedTimeType decode: '19010101000000.123456Z') = (DateAndTime epoch + (Duration nanoSeconds: 123456000 )).
	self assert: (ASN1GeneralizedTimeType decode: '19010101020000.123456+0200') = ((DateAndTime epoch + (Duration nanoSeconds: 123456000 )) offset: 2 hours).
