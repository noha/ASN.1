X.680 grammar
componentTypeLists 
	" there can be quite a few combinations of components, extensions and extensionadditions.
	Extension comes as string and the others as collection"
	^ super componentTypeLists ==> [:nodes| | col |
		col := OrderedCollection new. 
		(nodes reject: #isNil) do: [ :each |
			(each isCollection and: [ each isString not ])
				ifTrue: [ col addAll: each  ]
				ifFalse: [  col add: each ]].
			col ]