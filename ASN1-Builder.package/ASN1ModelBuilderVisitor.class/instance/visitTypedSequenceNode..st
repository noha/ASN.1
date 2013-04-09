visiting
visitTypedSequenceNode: aNode
	^ ASN1TypedSequence new
		type: (self visit: aNode type);
		definingModule: module