Class {
	#name : #ASN1ElementCollection,
	#superclass : #ASN1ElementSet,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1ElementCollection >> elements [
	^ elements
]

{ #category : #accessing }
ASN1ElementCollection >> elements: anObject [
	elements := anObject
]

{ #category : #finding }
ASN1ElementCollection >> findElement: aBlock [
	elements do: [ :each |
			(each findElement: aBlock) ifNotNil: [ :result| ^ result ]  ].
	 ^ nil
		
]
