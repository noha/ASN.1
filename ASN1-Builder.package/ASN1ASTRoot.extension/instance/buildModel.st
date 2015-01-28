*asn1-builder
buildModel
	| visitor |
	self annotateAsts.
	visitor := ASN1ModelBuilderVisitor new.
	^ self newModelRoot
		in: [ :root |
			( self accept: visitor) do: [ :module |
				root addModule: module ] ];
		yourself