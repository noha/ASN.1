X.680 grammar
reference
	^ super reference ==> [:node| 
		(node class = ASN1ReferenceNode ) ifFalse: [ 
			Transcript show: self class name printString ,'>>reference: got non-reference ', node name; cr ] .
		 node asn1Reference  ]