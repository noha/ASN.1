as yet unclassified
resolveableDefinedSyntax
	<definition: #example>
	^ '
CriticalityType ::= ENUMERATED {ignore(0), abort(1)}
	
EXTENSION ::= CLASS {
   &ExtensionType,
   &criticality      CriticalityType DEFAULT ignore,
   &id   Code}

WITH SYNTAX {
   EXTENSION-SYNTAX  &ExtensionType
   CRITICALITY       &criticality
   IDENTIFIED BY     &id
   }

firstExtension EXTENSION ::= {
   EXTENSION-SYNTAX  NULL
   CRITICALITY       ignore
   IDENTIFIED BY     global : {itu-t(0) identified-organization(4) organisation(0) gsm(1)
                  capextension(2)}
   }
'