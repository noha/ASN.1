X.680 grammar
taggedType
	"spec:
		TaggedType ::=
   			Tag Type |
   			Tag IMPLICIT Type |
   			Tag EXPLICIT Type"
	^ tag trim, 
		( 'IMPLICIT' asParser / 'EXPLICIT' asParser ) trim optional , 
		type 