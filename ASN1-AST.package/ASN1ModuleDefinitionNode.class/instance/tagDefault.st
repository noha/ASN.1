accessing
tagDefault
	^ tagDefault ifNil: [
		tagDefault := ASN1ExplicitTags  ]