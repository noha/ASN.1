visiting
visitOpenType: anOpenType
	self flag: #hack.
	"oid := ASN1OpenTypeDefinition signal."
	^ currentValue isAsn1TaggedValue 
		ifTrue: [ currentValue ]
		ifFalse: [ self visit: currentValue type ]