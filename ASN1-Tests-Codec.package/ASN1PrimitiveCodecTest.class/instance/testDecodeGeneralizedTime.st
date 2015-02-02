tests
testDecodeGeneralizedTime
	self assert: (ASN1GeneralizedTimeType decode: '19010101000000.123456Z') = (DateAndTime epoch + (Duration nanoSeconds: 123456000 ))