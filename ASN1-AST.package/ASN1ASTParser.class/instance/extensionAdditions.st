X.680 grammar
extensionAdditions
	^ super extensionAdditions ==> [:nodes|
		nodes ifNotNil: [
			ASN1ExtensionAdditionsNode new
				content: nodes] ]