X.680 grammar
moduleDefinition
	"Spec:
		ModuleDefinition ::= 
			ModuleIdentifier 
			DEFINITIONS
			EncodingReferenceDefault 
			TagDefault 
			ExtensionDefault '::='
			BEGIN
			ModuleBody EncodingControlSections
			END"
	^ moduleIdentifier,
		'DEFINITIONS' asParser asn1Token,
		encodingReferenceDefault,
		tagDefault,
		extensionDefault,
		'::=' asParser trim,
		'BEGIN' asParser asn1Token,
		moduleBody,
		encodingControlSections,
		'END' asParser asn1Token ==> [:n| 
			Array with: n first with: n third with: n fourth with: n fifth with: n eighth with: n ninth ]