X.680 grammar
componentTypeList
	"spec:
		ComponentTypeList ::=
   			ComponentType |
   			ComponentTypeList ',' ComponentType"
	^ (componentType separatedBy: $, asParser asn1Token) withoutSeparators 