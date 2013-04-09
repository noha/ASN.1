X.680 grammar
tagClass
	"spec:
		Class ::=
   			UNIVERSAL |
   			APPLICATION |
   			PRIVATE |
  			 empty"
	^ ('UNIVERSAL' asParser / 'APPLICATION' asParser / 'PRIVATE' asParser) optional 