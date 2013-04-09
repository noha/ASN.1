visiting
visitChoiceValueNode: aChoiceValueNode 
	^ ASN1ChoiceValue new
		choice: aChoiceValueNode choice;
		value: aChoiceValueNode value