X.681 grammar
objectSetSpec
	"Spec:
		ObjectSetSpec ::= 
			RootElementSetSpec |
			RootElementSetSpec ',' '...' |
			'...' |	
			'...' ',' AdditionalElementSetSpec |
			RootElementSetSpec ',' '...' ',' AdditionalElementSetSpec"
	"Spec: AdditionalElementSetSpec ::= ElementSetSpec"
	"Spec:RootElementSetSpec ::= ElementSetSpec"
	^ (elementSetSpec, $, asParser asn1Token , '...' asParser asn1Token, $, asParser asn1Token, elementSetSpec) /
		(elementSetSpec, ($, asParser asn1Token, '...' asParser asn1Token) optional) /
		('...' asParser trim, $, asParser asn1Token, elementSetSpec) /
		'...' asParser asn1Token
			