X.680 grammar
nameAndNumberForm
	^ super nameAndNumberForm ==> [:nodes|
		ASN1ObjectIdComponentNode new
			name: nodes first;
			number: nodes second ]