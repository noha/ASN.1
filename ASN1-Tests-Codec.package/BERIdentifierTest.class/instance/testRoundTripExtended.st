as yet unclassified
testRoundTripExtended
	| ident |

	ident := BERIdentifier parseFrom: #[159 34] readStream.
	self deny: ident isConstructed.
	self assert: ident tag clazzString equals: 'CONTEXT'.
	self assert: ident tag number equals: 34.
	self assert: (ByteArray streamContents: [:str | ident writeOn: str]) equals: #[159 34].

	ident := BERIdentifier parseFrom: #[159 180 57] readStream.
	self deny: ident isConstructed.
	self assert: ident tag clazzString equals: 'CONTEXT'.
	self assert: ident tag number equals: 6713.
	self assert: (ByteArray streamContents: [:str | ident writeOn: str]) equals: #[159 180 57].