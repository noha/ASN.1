X.680 grammar
integerType
	^ super integerType ==> [:nodes| | intergerType |
		integerType := ASN1IntegerTypeNode new.
		nodes second ifNotNil: [:namedNumbers|
			namedNumbers do: [:each|
				integerType addNamedNumber: each ]].
		integerType]