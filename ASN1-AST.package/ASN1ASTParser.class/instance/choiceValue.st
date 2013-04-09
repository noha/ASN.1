X.680 grammar
choiceValue
	^ super choiceValue ==> [:n|
		ASN1ChoiceValueNode new 
			choice: n first;
			value: n third ] 