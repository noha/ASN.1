as yet unclassified
createInstance: aNode
	^ (aNode class = ASN1IntegerValueNode )
		ifTrue: [ aNode ]
		ifFalse: [ ASN1IntegerValueNode new value: aNode ]
