as yet unclassified
constructedComplexChoice
	<definition: #example>
	^'UnconstructedChoice1 ::= OCTET STRING (SIZE (1..5))
UnconstructedChoice2 ::= OCTET STRING (SIZE (1..5))

      InnerChoice ::= CHOICE {
        ext-BearerService       [2] UnconstructedChoice1,
        ext-Teleservice [3] UnconstructedChoice2}

	SequenceWithConstruction ::= [4] SEQUENCE {
          basicService    [5]    InnerChoice     OPTIONAL,
          bla [6] OCTET STRING OPTIONAL
      }'
