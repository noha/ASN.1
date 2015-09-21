visiting
visitOpenType: anOpenType
	self flag: #hack.
	"oid := ASN1OpenTypeDefinition signal."
	^ currentValue isAsn1EncodedValue 
		ifTrue: [ currentValue ]
		ifFalse: [ 
			self push: currentValue value 
			during: [self visit: currentValue type ] ]