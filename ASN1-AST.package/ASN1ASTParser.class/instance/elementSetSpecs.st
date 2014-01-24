X.680 grammar
elementSetSpecs
	^ super elementSetSpecs ==> [ :nodes | | set |
		set := nodes first .
		nodes second ifNotNil: [ :ext |
			set add: ASN1ExtensionNode new.
			ext third ifNotNil: [ 
				set := set merge: ext third second ] ].
		set ]