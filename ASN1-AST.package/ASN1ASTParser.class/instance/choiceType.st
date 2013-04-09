X.680 grammar
choiceType
	^ super choiceType ==> [:nodes|   
		ASN1ChoiceNode new
			elements: nodes first;
			rest: (nodes copyFrom: 2 to: 4)] 