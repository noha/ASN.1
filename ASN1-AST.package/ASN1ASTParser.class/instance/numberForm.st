X.680 grammar
numberForm
	^ super numberForm ==> [:node|
		node isAllDigits 
			ifTrue: [ Number readFrom: node ]
			ifFalse: [ node ]]