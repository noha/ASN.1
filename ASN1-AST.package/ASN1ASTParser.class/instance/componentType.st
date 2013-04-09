X.680 grammar
componentType
	^ super componentType ==> [:nodes|
		(nodes first = 'COMPONENTS OF') 
			ifTrue: [ ASN1ComponentsOfNode new type: nodes second ]
			ifFalse: [ nodes first modifiers: nodes second ]]