testing
operationWithCode: aNumber
	^ elements do: [ :each|
		(each operationWithCode: aNumber) ifNotNil: [ :op|
			^ op ] ]