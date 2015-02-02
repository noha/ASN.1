tests
testEncodeUTF8String
	self assert: (ASN1UTF8StringType encode: ('ascii ', 16r14B asCharacter asString)) = #[97 115 99 105 105 32 197 139]
.
