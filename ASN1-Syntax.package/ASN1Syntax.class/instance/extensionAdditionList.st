X.680 grammar
extensionAdditionList
	"spec:
		ExtensionAdditionList ::=
   			ExtensionAddition |
   			ExtensionAdditionList ',' ExtensionAddition"
	^ (extensionAddition separatedBy: $, asParser trim) withoutSeparators 