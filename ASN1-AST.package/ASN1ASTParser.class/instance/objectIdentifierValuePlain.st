X.680 grammar
objectIdentifierValuePlain
	^ super objectIdentifierValue ==> [:nodes|
		ASN1ObjectIdNode components: (
			(nodes size = 1) 
				ifTrue: [ Array with: nodes first ]
				ifFalse: [
					nodes second isCollection 
						ifTrue: [ nodes first 
							ifNotNil: [ nodes second copyWithFirst: nodes first ]
							ifNil: [ nodes second ] ]
						ifFalse: [  nodes ]] )  ]