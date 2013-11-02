as yet unclassified
testConstructedComplexChoice
	| sequence basicService |
	sequence := (self modelBindingValue: 'SequenceWithConstruction') type.
	basicService := (sequence elementAt: 'basicService') value.
	self assert: basicService isExplicitlyTagged.
	self assert: basicService explicitTag = (ASN1Tag new number: 5; yourself).