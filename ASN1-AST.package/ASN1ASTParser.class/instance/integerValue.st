X.680 grammar
integerValue
	"^ (signedNumber flatten ==> [:node|  ASN1IntegerValueNode new value: node ])
		/ (identifier ==> [:node| | ambi |
			ambi := ASN1AmbiguousNode new.
			ambi name: node.
			ambi addAlternative: (ASN1IntegerValueNode new value: node ).
			ambi addAlternative: node asn1Reference ])"
 
	^ super integerValue  ==> [:node|  
		(Number 
			readFrom: node
			ifFail: [ nil ])
				ifNotNil: [:num| ASN1IntegerValueNode new value: num ]
				ifNil: [ node asn1Reference ]] 