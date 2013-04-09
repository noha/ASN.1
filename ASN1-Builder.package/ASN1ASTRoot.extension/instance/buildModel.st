*asn1-builder
buildModel
	| visitor |
	self annotateAsts.
	visitor := ASN1ModelBuilderVisitor new.
	^ ASN1ModelRoot new
		modules:( self accept: visitor)