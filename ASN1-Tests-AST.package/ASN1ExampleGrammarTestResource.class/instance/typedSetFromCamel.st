as yet unclassified
typedSetFromCamel
	<definition: #example>
	^ '
	PARAMETERS-BOUND ::= CLASS {                                                            
        &minGenericNumberLength                                         INTEGER,
        &maxGenericNumberLength                                         INTEGER,
        &numOfGenericNumbers                                            INTEGER 
}       
GenericNumber {PARAMETERS-BOUND : bound} ::= OCTET STRING (SIZE(
        bound.&minGenericNumberLength .. bound.&maxGenericNumberLength))
GenericNumbers {PARAMETERS-BOUND : bound} ::= SET SIZE(1..bound.&numOfGenericNumbers) OF GenericNumber {bound}
ConnectArgV1 ::= SEQUENCE {
        genericNumbers                          [14] GenericNumbers                             OPTIONAL
}
'
