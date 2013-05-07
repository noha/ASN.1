testing
includesType: aType
	^ (super includesType: aType) or: [
		attributes values anySatisfy: [ :each | each isAsn1Type and: [ each includesType: aType ]  ]  ]