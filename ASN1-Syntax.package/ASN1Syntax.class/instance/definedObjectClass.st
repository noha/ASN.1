X.681 grammar
definedObjectClass
	"Spec:
		DefinedObjectClass ::= 
			ExternalObjectClassReference |
			objectclassreference |
			UsefulObjectClassReference"
	^ externalObjectClassReference /
		objectClassReference /
		usefulObjectClassReference
		