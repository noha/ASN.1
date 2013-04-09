X.680 grammar
valueSet
	"a possible extension marker in between makes constructing a bit weird. Base set spec is in the first element but the
	additional set spec is nested deeply"
	^ super valueSet ==> [:nodes| | spec |
		spec :=  nodes first.
		(nodes second notNil and: [ nodes second third notNil ]) ifTrue: [
			spec := spec merge: nodes second third second ].
		ASN1ValueSetNode new elementsSpec: spec ] 