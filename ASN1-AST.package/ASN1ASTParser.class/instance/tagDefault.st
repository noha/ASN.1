X.680 grammar
tagDefault
	^ super tagDefault ==> [:nodes| 
		nodes 
			ifNotNil: [ ASN1TagEnvironment labelled: ($  split: nodes) first ]
			ifNil: [ ASN1ExplicitTags ]]