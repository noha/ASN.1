X.680 grammar
enumerations
	^ super enumerations ==> [:nodes| | enum |
		enum := nodes first asOrderedCollection.
		nodes second ifNotNil: [ :ext |
			 enum add: ASN1ExtensionNode new.
			 ext second ifNotNil: [
				enum addAll: ext second ]].
		enum ]