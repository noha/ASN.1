as yet unclassified
build: aCollection
	| asn1 |
	asn1 := ASN1 new.
	aCollection do: [ :each| asn1 addLibrary: each new ].
	^ asn1 model