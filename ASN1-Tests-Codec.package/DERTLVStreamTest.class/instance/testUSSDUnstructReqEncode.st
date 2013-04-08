tests
testUSSDUnstructReqEncode
	| req str wanted |
        wanted := #(16rA1 16r13 16r02 16r01 16r04 16r02 16r01 16r3B 16r30 16r0B 16r04 16r01 16r0F 16r04 16r06 16r2A 16rD5 16r4C 16r16 16r1B 16r01) asByteArray.

        req := {BERTag fromTuple: #(2 true 1). OrderedCollection
                with: {BERTag integer. #(4).}
                with: {BERTag integer. #(59).}
                with: {BERTag fromTuple: #(0 true 16). OrderedCollection
                    with: {BERTag octetString. #(15).}
                    with: {BERTag octetString. #(16r2A 16rD5 16r4C 16r16 16r1B 16r01)}.}.}.

        str := WriteStream on: (ByteArray new: 20).
        (DERTLVStream on: str) nextPut: req.

        self assert: str contents = wanted.
