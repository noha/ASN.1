tests
testEncodeUTCTime
	self assert: (ASN1UTCTimeType encode: (DateAndTime epoch + (Duration nanoSeconds: 123456000 ))) = '010101000000Z'
