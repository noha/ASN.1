X.680 grammar
extensionAdditionGroup
	"spec:
		ExtensionAdditionGroup ::= '[[' VersionNumber ComponentTypeList ']]'"
	^ '[[' asParser trim, 
			 versionNumber, 
			componentTypeList , 
			']]' asParser trim