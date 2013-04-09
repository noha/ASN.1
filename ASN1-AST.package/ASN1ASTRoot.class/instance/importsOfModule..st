resolving
importsOfModule: aModuleIdentifier
	| visitor |
	visitor := ASN1ImportModuleNamesVisitor new.
	(self moduleWithIdentifier: aModuleIdentifier) accept: visitor.
	^ visitor identifiers