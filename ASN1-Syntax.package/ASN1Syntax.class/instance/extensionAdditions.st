X.680 grammar
extensionAdditions
	"spec:
		ExtensionAdditions ::=
   			',' ExtensionAdditionList |
   			empty"
	^ (($, asParser trim, extensionAdditionList) optional) ==> [:nodes|
		nodes ifNotNil: [ nodes second ]]