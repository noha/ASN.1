*asn1-model
definesOid: aString
self halt.
	^ (type = 'OBJECT IDENTIFIER')
			and: [ value = aString ]