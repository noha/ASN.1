Extension { #name : #ASN1ASTRoot }

{ #category : #'*asn1-builder' }
ASN1ASTRoot >> buildModel: aClass [
	| visitor |
	self annotateAsts.
	visitor := ASN1ModelBuilderVisitor new.
	^ aClass new
		in: [ :root |
			( self accept: visitor) do: [ :module |
				root addModule: module ] ];
		yourself
]
