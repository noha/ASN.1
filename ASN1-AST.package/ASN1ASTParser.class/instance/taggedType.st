X.680 grammar
taggedType
	^ super taggedType ==> [:nodes|
		ASN1TaggedTypeNode new
			tag: nodes first;
			tagEnvironment: (nodes second ifNotNil: [:mod| ASN1TagEnvironment labelled: mod  ]);
			type: nodes third ]