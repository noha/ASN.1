tests
testDecodeEncodeAll
	| data decoded stream |
        "I test that we can encode what we decode. At least to
         some very very basic degree."

        data := #(16rA1 16r13 16r02 16r01 16r04 16r02 16r01 16r3B
                  16r30 16r0B 16r04 16r01 16r0F 16r04 16r06 16r2A
                  16rD5 16r4C 16r16 16r1B 16r01) asByteArray.

        decoded := (DERTLVStream on: data readStream) next.

        stream := WriteStream on: (ByteArray new: 20).
        (DERTLVStream on: stream) nextPutAll: decoded.

        self assert: data ~= decoded.
        self assert: stream contents = data.
