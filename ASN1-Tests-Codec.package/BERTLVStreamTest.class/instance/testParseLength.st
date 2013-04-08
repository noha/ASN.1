bla
testParseLength
	| data stream value |
        "I parse a simple example."

        data := #(16r03 16r07 16r04 16r0A 16r3B 16r5F 16r29 16r1C 16rD0) asByteArray.
        stream := BERTLVStream on: data readStream.
        value := stream next.
	self assert: value tag clazzIdentifier = 0.
	self assert: value tag number = 3.
      self assert: value contents = #(16r04 16r0A 16r3B 16r5F 16r29 16r1C 16rD0) asByteArray.
