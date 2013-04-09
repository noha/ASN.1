X.680 grammar
definitiveNameAndNumberForm
	^ super definitiveNameAndNumberForm ==> [:nodes|
		ASN1ObjectIdComponentNode new
			name: nodes first;
			number: (Number readFrom: nodes second) ]