*asn1-builder
buildModel: aClass
	| visitor |
	self annotateAsts.
	visitor := ASN1ModelBuilderVisitor new.
	^ aClass new
		in: [ :root |
			( self accept: visitor) do: [ :module |
				root addModule: module ] ];
		yourself