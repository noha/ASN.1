X.680 grammar
unions
	^ super unions ==> [:nodes|
		(nodes size > 1) 
			ifTrue: [
				ASN1UnionNode new
					elements: nodes]
			ifFalse: [ nodes first ]]