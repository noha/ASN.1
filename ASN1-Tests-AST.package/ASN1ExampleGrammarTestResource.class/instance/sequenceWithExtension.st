as yet unclassified
sequenceWithExtension
	<definition: #example>
	^'SequenceWithExtension ::= SEQUENCE {
  first      [0]  INTEGER,
  second [1]  INTEGER DEFAULT 2,
  third     [2]  INTEGER OPTIONAL,
  ...,                    
  fifth      [5]  INTEGER DEFAULT 5,
  sixth     [6] INTEGER
}
'
