Class {
	#name : #ASN1UTCTimeParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'utctime',
		'year',
		'month',
		'day',
		'hour',
		'minute',
		'second',
		'offset'
	],
	#category : 'ASN1-Codec'
}

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> day [
	^ (#digit asParser, #digit asParser) flatten ==> [:node|
		node asNumber ]
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> hour [
	^  (#digit asParser, #digit asParser) flatten ==> [:node|
		node asNumber ]
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> minute [
	^  (#digit asParser, #digit asParser) flatten ==> [:node|
		node asNumber ]
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> month [
	^  (#digit asParser, #digit asParser) flatten ==> [:node|
		node asNumber ]
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> offset [
	^ ($+ asParser / $- asParser), hour, minute ==> [:nodes| | duration |
		duration := Duration minutes: (60 * (nodes at: 2) asNumber) + (nodes at: 3) asNumber.
		((nodes at: 1) = $-)
			ifTrue: [ duration negated ]
			ifFalse: [ duration ]]
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> second [
	^  (#digit asParser, #digit asParser) flatten ==> [:node|
		node asNumber ]
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> start [
	^ utctime end
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> utctime [
	^ year, month, day, hour, minute,  second optional, ( $Z asParser / offset ) ==> [:nodes|
		DateAndTime 
			year: (nodes at: 1)
			month: (nodes at: 2)
			day: (nodes at: 3)
			hour: (nodes at: 4)
			minute: (nodes at: 5)
			second: ((nodes at: 6) ifNil: [ 0 ])
			nanoSecond: 0
			offset: (((nodes at: 7) = $Z) ifTrue: [ Duration minutes: 0 ] ifFalse: [ (nodes at: 7 )])
 ]
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeParser >> year [
	^  (#digit asParser, #digit asParser) flatten ==> [:node| | y |
		y := node asNumber.
		(y > 70) 
			ifTrue: [ 1900 + y]
			ifFalse:  [ 2000 + y ]]
]
