X.680 grammar
extensionAndException
	^ super extensionAndException ==> [:nodes|
		ASN1ExtensionAndExceptionNode new
			exception: nodes second]