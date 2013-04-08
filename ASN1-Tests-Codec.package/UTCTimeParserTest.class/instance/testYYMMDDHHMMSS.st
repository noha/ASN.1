as yet unclassified
testYYMMDDHHMMSS
	| dat |
	dat := ASN1UTCTimeParser parse: '820102120013Z'.
	self assert: dat year = 1982.
	self assert: dat offset = (Duration minutes: 0)
