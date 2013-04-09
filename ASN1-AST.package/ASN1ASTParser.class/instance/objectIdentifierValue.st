X.680 grammar
objectIdentifierValue 
	^ super objectIdentifierValue ==> [:nodes|
		ASN1ObjectIdNode components: (
			(nodes size = 1) 
				ifTrue: [ Array with: nodes first ]
				ifFalse: [
					nodes second isCollection 
						ifTrue: [ nodes first 
							ifNotNil: [ nodes second copyWithFirst: nodes first ]
							ifNil: [ self halt. nodes second ] ]
						ifFalse: [  nodes ]] )  ]