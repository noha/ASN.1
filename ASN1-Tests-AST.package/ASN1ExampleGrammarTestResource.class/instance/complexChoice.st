as yet unclassified
complexChoice
	<definition: #example>
	^ 'ComplexChoice ::= CHOICE { 
		one [APPLICATION 1] SimpleSequence, 
		two [APPLICATION 2] INTEGER, 
		three [APPLICATION 3] INTEGER, 
		four [APPLICATION 4] INTEGER }'