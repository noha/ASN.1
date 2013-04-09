x.680 grammer 1998
anyType
	"spec 1994"
	"AnyType ::= ANY | ANY DEFINED BY identifier"
	^ 'ANY' asParser trim, ('DEFINED' asParser trim, 'BY' asParser trim, identifier) optional