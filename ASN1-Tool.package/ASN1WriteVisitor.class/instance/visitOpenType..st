as yet unclassified
visitOpenType: anOpenType
	| oid |
	self flag: #hack.
	"oid := ASN1OpenTypeDefinition signal."
	^ stack top