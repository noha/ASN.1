X.680 grammar
sequenceType
	"spec:
		SequenceType ::=
   			SEQUENCE '{' '}' |
   			SEQUENCE '{' ExtensionAndException OptionalExtensionMarker '}' |
   			SEQUENCE '{' ComponentTypeLists '}'"
	^ 'SEQUENCE' asParser trim, 
		${ asParser asn1Token, (
			componentTypeLists /
			(extensionAndException, optionalExtensionMarker) 
			) optional,  
		$} asParser asn1Token ==> #third