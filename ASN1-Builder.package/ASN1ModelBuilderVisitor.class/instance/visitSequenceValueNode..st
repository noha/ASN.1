visiting
visitSequenceValueNode: aNode
	^ ASN1SequenceValue new
		module: module;
		elements: (aNode resolvedValue collect: [:resolved|
			resolved key -> (self visit: resolved value) ])