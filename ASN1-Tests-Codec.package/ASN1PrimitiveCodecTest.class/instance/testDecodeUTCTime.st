tests
testDecodeUTCTime
	self assert: (ASN1UTCTimeType decode: '010101000000Z') = (DateAndTime year: 2001 month: 1 day: 1 offset: 0 hours).
	self assert: (ASN1UTCTimeType decode: '700101000000Z') = (DateAndTime unixEpoch)