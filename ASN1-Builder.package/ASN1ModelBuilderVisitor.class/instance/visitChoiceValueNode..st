visiting
visitChoiceValueNode: aChoiceValueNode 
	^ ASN1ChoiceValue new
		type: aChoiceValueNode choice;
		value: aChoiceValueNode value;
		module: module