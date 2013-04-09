X.680 grammar
setType
	"spec:
		SetType ::=
   			SET '{' '}' |
   			SET '{' ExtensionAndException OptionalExtensionMarker '}' |
   			SET '{' ComponentTypeLists '}'"
	^ 'SET' asParser, 
		${ asParser trim, (
			(extensionAndException , optionalExtensionMarker) /
			componentTypeLists) optional,  
		$} asParser trim ==> #third