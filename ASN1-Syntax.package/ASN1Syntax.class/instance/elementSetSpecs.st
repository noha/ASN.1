X.680 grammar
elementSetSpecs
	"Spec:
		ElementSetSpecs ::= 
			RootElementSetSpec |
			RootElementSetSpec ',' '...'  |	
			RootElementSetSpec ',' '...' ',' AdditionalElementSetSpec"
	"Spec: AdditionalElementSetSpec ::= ElementSetSpec"
	"Spec: RootElementSetSpec ::= ElementSetSpec"
	^ elementSetSpec, 
		($, asParser trim, '...' asParser trim, 
			($, asParser trim, elementSetSpec) optional) optional