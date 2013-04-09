X.680 grammar
exceptionSpec
	"spec:
	ExceptionSpec ::= '!' ExceptionIdentification | empty"
	
	^ ('!' asParser trim, exceptionIdentification) optional