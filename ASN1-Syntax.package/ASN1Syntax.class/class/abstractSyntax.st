as yet unclassified
abstractSyntax
	^ 
	'ABSTRACT-SYNTAX ::= CLASS {
       	&id       OBJECT IDENTIFIER,
       	&Type     ,
       	&property BIT STRING {handles-invalid-encodings(0)}
                   DEFAULT {} }
     		WITH SYNTAX { &Type IDENTIFIED BY &id
                   [HAS PROPERTY &property] }'