X.680 grammar
signedNumber
	^ super signedNumber ==> [:nodes| 
		nodes first notNil 
			ifTrue: [ nodes second asNumber negated ]
			ifFalse: [ nodes second asNumber ]]