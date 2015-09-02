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
	^ ((elementSetSpec, 
			$, asParser asn1Token , 
			'...' asParser asn1Token, 
			$, asParser asn1Token, 
			elementSetSpec) ==> [:n | Array with: n first with: n third with:n fifth ])  /
		((elementSetSpec, 
			$, asParser asn1Token, 
			'...' asParser asn1Token) ==> [ :n | Array with: n first with: n third ])  /
		(elementSetSpec ==> [ :n| Array with: n ])  /
		(('...' asParser trim, 
			$, asParser asn1Token, 
			elementSetSpec) ==> [ :n | Array with: n first with: n third ])  /
		( '...' asParser asn1Token ==> [ :n | Array with: n  ])
			