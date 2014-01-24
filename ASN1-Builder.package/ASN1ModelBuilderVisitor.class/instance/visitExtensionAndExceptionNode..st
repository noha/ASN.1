visiting
visitExtensionAndExceptionNode: anExtensionNode 
	"ignoring the exception for now"
	self flag: #needsRedesign.
	^ ASN1Extension new