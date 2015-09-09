accessing
next
	^ [ self nextTaggedValue ]
		on: ASN1PrematureEndOfStream 
		do: [ :error | ASN1EncodedError new ]