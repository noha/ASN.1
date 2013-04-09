X.680 grammar
integerType
	"spec:
		IntegerType ::=
  			INTEGER |
   			INTEGER '{' NamedNumberList '}' "
	^ ('INTEGER' asParser trim, 
		( ${ asParser trim , namedNumberList, $} asParser trim) optional )  ==> [:nodes|
				 Array with: nodes first with: ((nodes second notNil)
					ifTrue: [ nodes second second ]
					ifFalse: [ nil ])
			 ]