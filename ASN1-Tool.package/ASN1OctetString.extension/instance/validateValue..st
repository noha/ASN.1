*asn1-tool
validateValue: aString 
	(aString isByteString or: [ aString class = ByteArray ]) ifFalse: [ 
		ASN1InvalidValue signal: 'cannot apply value ', aString asString, ' to type ', self class universalType  ]