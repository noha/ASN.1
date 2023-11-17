Class {
	#name : #UTCTimeParserTest,
	#superclass : #TestCase,
	#category : 'ASN1-Tests-Codec'
}

{ #category : #'as yet unclassified' }
UTCTimeParserTest >> testYYMMDDHHMM [
	| dat |
	dat := ASN1UTCTimeParser parse: '1201021200-0200'.
	self assert: dat year = 2012.
	self assert: dat offset = (Duration minutes: -120)

]

{ #category : #'as yet unclassified' }
UTCTimeParserTest >> testYYMMDDHHMMSS [
	| dat |
	dat := ASN1UTCTimeParser parse: '820102120013Z'.
	self assert: dat year = 1982.
	self assert: dat offset = (Duration minutes: 0)

]
