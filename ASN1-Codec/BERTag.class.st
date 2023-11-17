"
I am a TAG as of X.690
"
Class {
	#name : #BERTag,
	#superclass : #Object,
	#instVars : [
		'classType',
		'tagValue',
		'constructed'
	],
	#category : 'ASN1-Codec-BER'
}

{ #category : #'x690 types' }
BERTag class >> boolean [
        ^ self fromTuple: #(0 false 1)

]

{ #category : #class }
BERTag class >> classApplication [
        ^ 1

]

{ #category : #class }
BERTag class >> classContext [
        ^ 2

]

{ #category : #class }
BERTag class >> classPrivate [
        ^ 3

]

{ #category : #class }
BERTag class >> classUniversal [
        ^ 0

]

{ #category : #'x690 types' }
BERTag class >> endOfContents [
        ^ self fromTuple: #(0 false 0)

]

{ #category : #'x690 types' }
BERTag class >> enumerated [
        ^ self fromTuple: #(0 false 10)

]

{ #category : #creation }
BERTag class >> fromTuple: aTuple [
        ^ self new
            fromTuple: aTuple;
            yourself

]

{ #category : #'x690 types' }
BERTag class >> integer [
        ^ self fromTuple: #(0 false 2)

]

{ #category : #'instance creation' }
BERTag class >> new [
        ^ super new initialize

]

{ #category : #'x690 types' }
BERTag class >> null [
        ^ self fromTuple: #(0 false 5)

]

{ #category : #'x690 types' }
BERTag class >> octetString [
        ^ self fromTuple: #(0 false 4)

]

{ #category : #creation }
BERTag class >> parseFrom: aStream [
        ^ self new
            parseFrom: aStream;
            yourself

]

{ #category : #'x690 types' }
BERTag class >> sequence [
        ^ self fromTuple: #(0 true 16)

]

{ #category : #'x690 types' }
BERTag class >> set [
        ^ self fromTuple: #(0 true 17)

]

{ #category : #comparing }
BERTag >> = aOther [
        (aOther isKindOf: self class) ifTrue: [^self asTuple = aOther asTuple].
        ^ self asTuple = aOther.

]

{ #category : #conversion }
BERTag >> asTuple [
        ^ Array with: self classType with: self isConstructed with: self tagValue.

]

{ #category : #accessing }
BERTag >> classType [
        ^ classType

]

{ #category : #decoding }
BERTag >> fromTuple: aTuple [
        classType := aTuple first bitAnd: 16r3.
        constructed := aTuple second.
        tagValue := aTuple third.

]

{ #category : #'initialize-release' }
BERTag >> initialize [
        classType := self class classUniversal.
        tagValue := 0.
        constructed := false.

]

{ #category : #accessing }
BERTag >> isConstructed [
        ^ constructed

]

{ #category : #accessing }
BERTag >> isPrimitive [
        ^ self isConstructed not

]

{ #category : #decoding }
BERTag >> parseExtendedTag: aStream [
        ^ self error: 'Extended tags are not implemented yet'.

]

{ #category : #decoding }
BERTag >> parseFrom: aStream [
	| tmp |
        tmp := aStream next asInteger.
        classType := (tmp bitAnd: 16rC0) bitShift: -6.
        constructed := (tmp bitAnd: 16r20) > 0.
        tagValue := tmp bitAnd: 16r1F.

        "This is an extended tag"
        (tagValue = 16r1F) ifTrue: [
            self parseExtendedTag: aStream.
        ].

]

{ #category : #printing }
BERTag >> printOn: aStream [
        ^ aStream 
			nextPutAll: self class printString;
			nextPut: Character space;
			nextPutAll: self asTuple printString
]

{ #category : #accessing }
BERTag >> tagValue [
        ^ tagValue

]

{ #category : #encoding }
BERTag >> writeExtendedTag: aStream [
        self error: 'Cannot encode extended tag.'

]

{ #category : #encoding }
BERTag >> writeOn: aStream [
        tagValue >= 16r1F
            ifTrue:  [self writeExtendedTag: aStream.]
            ifFalse: [| tag |
                tag := classType bitShift: 6.
                self isConstructed ifTrue: [tag := tag bitOr: 16r20].
                tag := tag bitOr: self tagValue.
                aStream nextPut: tag.
            ].

]
