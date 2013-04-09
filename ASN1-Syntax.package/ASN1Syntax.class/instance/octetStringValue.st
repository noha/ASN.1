X.680 grammar
octetStringValue
	"Spec:
		OctetStringValue ::=
			bstring |	
			hstring |	
			CONTAINING Value"
	^ bString / hString / ('CONTAINING' asParser trim, value)