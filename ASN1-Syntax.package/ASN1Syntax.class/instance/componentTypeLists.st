X.680 grammar
componentTypeLists
	"spec:
		ComponentTypeLists ::=
   			RootComponentTypeList |
   			RootComponentTypeList ',' ExtensionAndException ExtensionAdditions OptionalExtensionMarker |
   			RootComponentTypeList ',' ExtensionAndException ExtensionAdditions ExtensionEndMarker ',' RootComponentTypeList |
   			ExtensionAndException ExtensionAdditions ExensionEndMarker ',' RootComponentTypeList |
   			ExtensionAndException ExtensionAdditions OptionalExtensionMarker"
	"spec:
		RootComponentTypeList ::= ComponentTypeList"

	^ ((componentTypeList , $, asParser asn1Token, extensionAndException, extensionAdditions, extensionEndMarker, $, asParser asn1Token , componentTypeList   ) /
		(componentTypeList , $, asParser asn1Token, extensionAndException, extensionAdditions, optionalExtensionMarker  ) /

		(extensionAndException, extensionAdditions, extensionEndMarker, $, asParser asn1Token, componentTypeList) /
		(extensionAndException, extensionAdditions, optionalExtensionMarker ) /
		componentTypeList ) ==> [:nodes| nodes copyWithout: ',' ]
		