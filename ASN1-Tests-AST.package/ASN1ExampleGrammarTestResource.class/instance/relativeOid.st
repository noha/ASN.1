as yet unclassified
relativeOid
	<definition: #example>
	^ 'gsm-NetworkId OBJECT IDENTIFIER ::= 
        {mobileDomainId gsm-Network (1)}
	
	map-DialogueAS  OBJECT IDENTIFIER ::=
        {gsm-NetworkId as-Id map-DialoguePDU (1) version1 (1)}
	
	CommonComponentId ::= INTEGER (0..9)
	as-Id CommonComponentId ::= 1'