X.680 grammar
propertySettings
	"Spec:
		PropertySettings ::= SETTINGS simplestring"
	"Spec:
		A 'simplestring' shall consist of one or more ISO/IEC 10646 characters whose character code 
		is in the range 32 to 126, preceded and followed by a QUOTATION MARK (34) character (''). 
		It shall not contain a QUOTATION MARK (34) character (''). The 'simplestring' may span more 
		than one line of text, in which case any characters representing end-of- line shall be treated as 
		spacing characters. In analyzing an instance of use of this notation, a 'simplestring' is distinguished 
		from a 'cstring' by the context in which it appears."
	^ 'SETTINGS' asParser trim, cString