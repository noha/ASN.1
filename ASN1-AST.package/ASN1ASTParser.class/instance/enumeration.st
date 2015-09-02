X.680 grammar
enumeration
	"If we get named numbers the have values assigned. If we get just an identifier we create
	a dummy named number with nil value that can be assigned later"
	^ super enumeration ==> [:nodes| 
		nodes collect: [ :node |
			node isString
				ifTrue: [ ASN1NamedNumberNode name: node number: nil ]
				ifFalse: [ node ] ] ]