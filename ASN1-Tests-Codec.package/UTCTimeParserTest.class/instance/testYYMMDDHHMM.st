as yet unclassified
testYYMMDDHHMM
	| dat |
	dat := ASN1UTCTimeParser parse: '1201021200-0200'.
	self assert: dat year = 2012.
	self assert: dat offset = (Duration minutes: -120)
