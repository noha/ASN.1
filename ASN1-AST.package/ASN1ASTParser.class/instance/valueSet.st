X.680 grammar
valueSet
	"a possible extension marker in between makes constructing a bit weird. Base set spec is in the first element but the
	additional set spec is nested deeply"
	^ super valueSet ==> [:nodes|
		ASN1ValueSetNode new elementsSpec: nodes ] 