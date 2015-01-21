accessing
factory: anObject
	factory := anObject.
	model ifNotNil: [ factory asn1Model: model ]