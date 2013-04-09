*asn1-model
definesOid: aString
	^ (type = 'OBJECT IDENTIFIER')
			and: [ value = aString ]