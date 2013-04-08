bla
testParseSequence
	| data stream value inner |
        data := #(16r30 16r0A
                                16r16 16r05 83 109 105 116 104
                                16r01 16r01 16rFF) asByteArray.

        stream := BERTLVStream on: data readStream.
        value := stream next.
	self assert: value tag clazzIdentifier = 0.
	self assert: value tag number = 16r10.
	self assert: value elements size = 2.
	self assert: value elements first tag clazzIdentifier = 0.
	self assert: value elements first tag number = 22.
	self assert: value elements first contents asString = 'Smith'