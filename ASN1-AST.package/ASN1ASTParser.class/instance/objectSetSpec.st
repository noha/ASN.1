X.681 grammar
objectSetSpec
	^ super objectSetSpec ==> [ :nodes | 
		nodes collect: [ :node |
			(node = '...')
				ifTrue: [ ASN1ExtensionNode new asUnion ]
				ifFalse: [ node ] ] ]