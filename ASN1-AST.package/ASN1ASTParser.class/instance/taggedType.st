X.680 grammar
taggedType
	^ super taggedType ==> [:nodes|
		nodes third isCollection ifTrue: [ self halt ].
		ASN1TaggedTypeNode new
			tag: nodes first;
			modifier: (nodes second ifNotNil: [:mod| ASN1TagEnvironment labelled: mod  ]);
			type: nodes third ]