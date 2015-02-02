tests
testDecodeUTF8String
	self assert: (ASN1UTF8StringType decode: #[97 115 99 105 105 32 197 139])  = ('ascii ', (Character value: 16r14B) asString)