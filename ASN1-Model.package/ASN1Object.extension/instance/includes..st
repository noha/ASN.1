testing
includes: aType
	^ (super includes: aType) or:[
		attributes values anySatisfy: [ :each | each isAsn1Type and: [ each includes: aType ]  ]  ]