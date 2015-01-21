accessing
model: anObject
	model := anObject.
	factory ifNotNil: [ factory asn1Model: model ]