bla
testSimpleGSM
	| data stream value |
        "I should parse a simple GSM payload but the test is too basic. We
         don't carefully compare the result."
        data := #(16rA1 16r13 16r02 16r01 16r04 16r02 16r01 16r3B
                  16r30 16r0B 16r04 16r01 16r0F 16r04 16r06 16r2A
                  16rD5 16r4C 16r16 16r1B 16r01) asByteArray.

	value := (BERTLVStream on: data readStream) next.
	self assert: value tag clazzIdentifier = 2.
	self assert: value tag number = 1. 
	self assert: value elements size = 3.
