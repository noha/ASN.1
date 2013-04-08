tests
testUSSDReturnResult
	| req str wanted |

        wanted := #(16rA2 16r38 16r02 16r01 16r04 16r30 16r33 16r02 16r01 16r3B 16r30 16r2E 16r04 16r01 16r0F 16r04 16r29 16rC2 16r30 16r3B 16rEC 16r1E 16r97 16r41 16rE9 16rB9 16r4E 16r46 16r8B 16rB9 16r60 16r30 16r50 16rDD 16r9D 16rA6 16rCF 16r59 16r65 16r3C 16r3C 16r2D 16r4F 16rBB 16rCF 16rA0 16rB7 16r5B 16r17 16r8B 16rB5 16r60 16rB7 16r96 16r0C 16r16 16r8B 16r01) asByteArray.

        req := {BERTag fromTuple: #(2 true 2). OrderedCollection
                    with: {BERTag integer. #(4)}
                    with: {BERTag sequence. OrderedCollection
                        with: {BERTag integer. #(59)}
                        with: {BERTag sequence. OrderedCollection
                            with: {BERTag octetString. #(15)}
                            with: {BERTag octetString. #(194 48 59 236 30 151 65 233 185 78 70 139 185 96 48 80 221 157 166 207 89 101 60 60 45 79 187 207 160 183 91 23 139 181 96 183 150 12 22 139 1)}
                        }
                    }
            }.

        str := WriteStream on: (ByteArray new: 2).
        (DERTLVStream on: str) nextPut: req.
        self assert: str contents = wanted.
