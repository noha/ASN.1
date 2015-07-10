accessing
next
	^ [ self nextTaggedValue ]
		on: ASN1PrematureEndOfStream 
		do: [ :error | ASN1TaggedError new ]