X.680 grammar
valueAssignment
	^ super valueAssignment ==> [:nodes| 
		nodes third isAsn1Node ifFalse: [ self halt ].
		ASN1AssignmentNode new
			left: (nodes first
					type: nodes second;
					declaration: true);
			right:  nodes third 
		]