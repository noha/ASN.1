X.680 grammar
integerType
	^ super integerType ==> [:nodes| | intergerType |
		integerType := ASN1IntegerNode new.
		nodes second ifNotNilDo: [:namedNumbers|
			namedNumbers do: [:each|
				integerType addNamedNumber: each ]].
		integerType]