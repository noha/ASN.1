Class {
	#name : #ASN1SequenceType,
	#superclass : #ASN1CollectionType,
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1SequenceType class >> universalType [ 
	^ 'SEQUENCE'
]

{ #category : #visiting }
ASN1SequenceType >> accept: aVisitor [ 
	^ aVisitor visitSequenceType: self
]

{ #category : #accessing }
ASN1SequenceType >> keys [
	^ elements keys reject: [ :each | each = #extensionMarker ]
]

{ #category : #accessing }
ASN1SequenceType >> tag [
	^ self universalTag
]

{ #category : #validating }
ASN1SequenceType >> validate: anObject [
	elements associations do: [ :binding | | fieldType |
		binding isExtension ifFalse: [  
			fieldType := binding value.
			fieldType isOptional ifFalse: [ 
				(anObject includesKey: binding key) ifFalse: [ ASN1MandatoryElementNotFound signal: binding key, ' not found' ] ].
			(anObject includesKey: binding key) ifTrue: [ | val |
				val := (anObject privAt: binding key).
				self validateType: fieldType value: val ] ] ]
]
