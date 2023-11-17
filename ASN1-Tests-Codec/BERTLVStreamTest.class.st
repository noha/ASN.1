Class {
	#name : #BERTLVStreamTest,
	#superclass : #BERStreamTest,
	#category : 'ASN1-Tests-Codec'
}

{ #category : #bla }
BERTLVStreamTest >> testMoreGSM [
	| data |
        data := #(16rA1 16r20 16r02 16r01 16r01 16r02 16r01 16r3B
                  16r30 16r18 16r04 16r01 16r0F 16r04 16r13 16r2A
                  16rD5 16r4C 16r26 16r53 16rC5 16r64 16rB1 16r18
                  16r2D 16r16 16rAB 16rC9 16r68 16rB1 16rD8 16r0D
                  16r37 16r02) asByteArray.
        (BERTLVStream on: data readStream) next.

]

{ #category : #bla }
BERTLVStreamTest >> testParseLength [
	| data stream value |
        "I parse a simple example."

        data := #(16r03 16r07 16r04 16r0A 16r3B 16r5F 16r29 16r1C 16rD0) asByteArray.
        stream := BERTLVStream on: data readStream.
        value := stream next.
	self assert: value tag clazzIdentifier = 0.
	self assert: value tag number = 3.
      self assert: value contents = #(16r04 16r0A 16r3B 16r5F 16r29 16r1C 16rD0) asByteArray.

]

{ #category : #bla }
BERTLVStreamTest >> testParseSequence [
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
]

{ #category : #bla }
BERTLVStreamTest >> testSimpleGSM [
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

]
