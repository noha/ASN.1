X.681 grammar
objectSet
	^ super objectSet ==> [:nodes| 
		(nodes = '...') 
			ifTrue: [ ASN1ObjectSetNode new ]
			ifFalse: [
				ASN1ObjectSetNode new
					elementsSpec: (
						(nodes reject: [:each| each isNil or: [each isString]])
						fold: [:a :b| a merge: b]) ]] 