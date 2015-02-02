tests
testDecodeUTCTime
	self assert: (ASN1UTCTimeType decode: '010101000000Z') = (DateAndTime epoch)