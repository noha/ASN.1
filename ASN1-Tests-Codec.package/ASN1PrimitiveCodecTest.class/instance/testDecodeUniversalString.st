tests
testDecodeUniversalString
	self assert: (ASN1UniversalStringType decode: #[0 0 0 97 0 0 0 115 0 0 0 99 0 0 0 105 0 0 0 105 0 0 0 32 0 0 1 75]) = 
('ascii ', 16r14B asCharacter asString)