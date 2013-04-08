as yet unclassified
parseFrom: aStream
	| octet |
	octet := aStream next asInteger.
	^ self new
		tag: (ASN1Tag 
			clazz: (ASN1Tag classLabelOf: (octet bitShift: -6))
			number: (self readNumberFrom: octet stream: aStream));
		constructed: (self isConstructed: octet).

