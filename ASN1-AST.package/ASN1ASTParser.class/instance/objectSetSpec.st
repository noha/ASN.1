X.681 grammar
objectSetSpec
	^ super objectSetSpec ==> [ :nodes | | col |
		col := OrderedCollection new.
		(nodes = '...')
			"last rule"
			 ifTrue: [  col add: ASN1ExtensionNode new asUnion]
			ifFalse: [
				"first rule"
				(nodes size = 5) ifTrue: [ 
					col
						add: nodes first;
						add: ASN1ExtensionNode new asUnion;
						add: nodes fifth  ].
				"second rule"
				(nodes size = 2) ifTrue: [ 
					col add: nodes first.
					nodes second ifNotNil: [
						col add: nodes third  ] ].
				"third rule"
				(nodes size = 3) ifTrue: [ 
					col 
						add: nodes first;
						add: ASN1ExtensionNode new asUnion ] ].
		col ]