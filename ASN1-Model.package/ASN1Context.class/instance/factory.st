accessing
factory
	^ factory ifNil: [ 
		factory := self defaultFactoryClass new
			asn1Model: model ]