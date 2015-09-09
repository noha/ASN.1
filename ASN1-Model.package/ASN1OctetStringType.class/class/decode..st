codec
decode: aCollection
	aCollection class == ByteArray ifFalse: [
		^ASN1InvalidValue signal: 'cannot apply value to type ', self universalType].
	^ aCollection 