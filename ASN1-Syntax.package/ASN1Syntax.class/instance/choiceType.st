X.680 grammar
choiceType
	"Spec:
		ChoiceType	::= CHOICE '{' AlternativeTypeLists '}' "
	"Spec:
		AlternativeTypeLists ::= 
			RootAlternativeTypeList |
			RootAlternativeTypeList ',' ExtensionAndException ExtensionAdditionAlternatives OptionalExtensionMarker"
	"Spec:
		RootAlternativeTypeList ::= AlternativeTypeList"
	^ ('CHOICE' asParser trim, 
		${asParser trim,
			(alternativeTypeList, 
				extensionAndException optional, extensionAdditionAlternatives optional, optionalExtensionMarker optional), 
			$} asParser trim) ==> #third