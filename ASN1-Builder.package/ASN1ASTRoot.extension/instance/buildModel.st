*asn1-builder
buildModel
	| visitor |
	self annotateAsts.
	visitor := ASN1ModelBuilderVisitor new.
	^ ASN1ModelRoot new 
		in: [ :root |
			( self accept: visitor) do: [ :module |
				root addModule: module ] ];
		yourself