as yet unclassified
new
	(self class = ASN1ValueNode) ifTrue: [
		Error signal: 'abstract'].
	^ super new 