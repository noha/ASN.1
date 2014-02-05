visiting
visitSequenceValueNode: aNode
	^ ASN1SequenceValue new
		elements: (aNode resolvedValue collect: [:resolved|
			resolved key -> (self visit: resolved value) ])