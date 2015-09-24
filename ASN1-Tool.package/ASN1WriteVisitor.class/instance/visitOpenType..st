visiting
visitOpenType: anOpenType
	self flag: #hack.
	"oid := ASN1OpenTypeDefinition signal."
	^ currentValue isAsn1EncodedValue 
		ifTrue: [ currentValue ]
		ifFalse: [ 
			self push: currentValue contents 
			during: [self visit: currentValue type ] ]