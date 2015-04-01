visiting
visitSequenceValueNode: aNode
	^ ASN1SequenceValue new
		definingModule: module;
		elements: (aNode resolvedValue collect: [:resolved|
			resolved key -> (self visit: resolved value) ])