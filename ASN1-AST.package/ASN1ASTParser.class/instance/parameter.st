X.683 grammar
parameter
	^ super parameter ==> [:nodes| | paramType |
		nodes first ifNotNil: [
			paramType := nodes first first isString 
				ifTrue: [ nodes first first asn1Reference ]
				ifFalse: [ nodes first first ]].
		ASN1ParameterNode new
			type: paramType;
			reference: nodes second ]