Class {
	#name : #ASN1RangeConstraintNode,
	#superclass : #ASN1ConstraintNode,
	#instVars : [
		'lowerValue',
		'upperValue',
		'lowerExcluded',
		'upperExcluded'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1RangeConstraintNode class >> lowerValue: aLowerValue upperValue: aUpperValue [
	^ self new
		lowerValue: aLowerValue;
		upperValue: aUpperValue 
]

{ #category : #accessing }
ASN1RangeConstraintNode >> lowerExcluded [
	^ lowerExcluded
]

{ #category : #accessing }
ASN1RangeConstraintNode >> lowerExcluded: anObject [
	lowerExcluded := anObject
]

{ #category : #accessing }
ASN1RangeConstraintNode >> lowerValue [
	^ lowerValue
]

{ #category : #accessing }
ASN1RangeConstraintNode >> lowerValue: anObject [
	lowerValue := anObject
]

{ #category : #printing }
ASN1RangeConstraintNode >> printOn: aStream [
	aStream
		nextPutAll: 'range(';
		nextPutAll: lowerValue printString;
		nextPutAll: '..';
		nextPutAll: upperValue printString;
		nextPutAll: ')'
]

{ #category : #accessing }
ASN1RangeConstraintNode >> upperExcluded [
	^ upperExcluded
]

{ #category : #accessing }
ASN1RangeConstraintNode >> upperExcluded: anObject [
	upperExcluded := anObject
]

{ #category : #accessing }
ASN1RangeConstraintNode >> upperValue [
	^ upperValue
]

{ #category : #accessing }
ASN1RangeConstraintNode >> upperValue: anObject [
	upperValue := anObject
]
