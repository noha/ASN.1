converting
flattenComponentsOf
	elements ifNil: [ ^ self ].
	elements := elements 
		inject: OrderedCollection new
		into: [:col :elem| 
			(elem class = ASN1ComponentsOfNode)
				ifTrue: [ col addAll: elem type dereferenced elements ]
				ifFalse: [ col add: elem ].
				col ]