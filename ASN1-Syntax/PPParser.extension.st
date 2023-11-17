Extension { #name : #PPParser }

{ #category : #'*asn1-syntax' }
PPParser >> /> aParser [ 
	"Answer a new parser that parses the receiver and aParser that returns the longest successful match."
	
	^ ASN1LongestChoiceParser with: self with: aParser
]
