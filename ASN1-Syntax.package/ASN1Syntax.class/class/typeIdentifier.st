as yet unclassified
typeIdentifier
	^ 
	'TYPE-IDENTIFIER ::= CLASS {
      	&id OBJECT IDENTIFIER UNIQUE,
      	&Type 
   	}
   	WITH SYNTAX {&Type IDENTIFIED BY &id}'
