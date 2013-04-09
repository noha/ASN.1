accessing
typeOf: aString
	| binding |
	binding := (self bindingOf: aString).
	binding type ifNil: [ 
		binding type: ASN1OpenTypeNode new ].
	^ binding type