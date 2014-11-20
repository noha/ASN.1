as yet unclassified
complexSequence
	<definition: #example>
	^ 'ComplexSequence ::= SEQUENCE { 
		foo INTEGER, 
		bar OCTET STRING, 
		sub SubSequence}
	SubSequence ::= SEQUENCE { 
		sub1 INTEGER, 
		sub2 OCTET STRING, 
		sub3 SimpleSequence}'