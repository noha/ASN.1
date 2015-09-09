validating
validate: aString 
	super validate: aString.
	((aString class = ByteArray) or: [ aString isByteString ]) ifFalse: [ 
		ASN1InvalidValue signal: 'cannot apply value ', aString asString, ' to type ', self class universalType  ]