bla
testMoreGSM
	| data |
        data := #(16rA1 16r20 16r02 16r01 16r01 16r02 16r01 16r3B
                  16r30 16r18 16r04 16r01 16r0F 16r04 16r13 16r2A
                  16rD5 16r4C 16r26 16r53 16rC5 16r64 16rB1 16r18
                  16r2D 16r16 16rAB 16rC9 16r68 16rB1 16rD8 16r0D
                  16r37 16r02) asByteArray.
        (BERTLVStream on: data readStream) next.
