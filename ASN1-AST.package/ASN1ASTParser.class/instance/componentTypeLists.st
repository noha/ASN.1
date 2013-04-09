X.680 grammar
componentTypeLists 
	^ super componentTypeLists ==> [:nodes| | col |
		col := OrderedCollection new. 
		(nodes reject: [:each| each isNil]) do: [:each|
			(each isCollection & each isString not) 
				ifTrue: [ col addAll: each]
				ifFalse: [
					each isTypeNode ifTrue: [
						col add: each ]. 
					(each class = ASN1ExtensionAdditionsNode) ifTrue: [
						col addAll: each content ]]].
		col]