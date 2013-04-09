*asn1-builder
buildModel
	[ ^ self buildAstRoot buildModel ]
		on: ASN1MissingModule 
		do: [:err| err resume:  (self contentsOfModuleNamed: err identifier name label)].