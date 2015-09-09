visiting
visitSequenceNode: aNode
	| node |
	node := aNode normalized.
	^ ASN1SequenceType new
		definingModule: module;
		elements: ((self visitAll: node elements) ifNotNil: [ :col |
			col inject: SmallDictionary new into: [ :dict :elem |
				elem value isExtension 
					ifTrue: [ dict at: #extensionMarker put: elem; yourself ]
					ifFalse: [ dict at: elem key put: elem value; yourself ].
				dict ] ])