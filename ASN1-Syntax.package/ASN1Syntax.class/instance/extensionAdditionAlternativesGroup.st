X.680 grammar
extensionAdditionAlternativesGroup
	"Spec:
		ExtensionAdditionAlternativesGroup ::=
			'[[' VersionNumber AlternativeTypeList ']]' "
	^ '[[' asParser trim, 
			versionNumber, 
			alternativeTypeList, ']]' asParser trim