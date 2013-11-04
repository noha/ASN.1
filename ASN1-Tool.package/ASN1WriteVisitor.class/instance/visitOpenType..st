visiting
visitOpenType: anOpenType
	self flag: #hack.
	"oid := ASN1OpenTypeDefinition signal."
	^ stack top isAsn1TaggedValue 
		ifTrue: [ stack top ]
		ifFalse: [ self visit: stack top type ]