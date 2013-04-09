*asn1-ast
astRootFromAllFilesIn: aDirectoryPath encoding: anEncoding
	| astRoot |
	astRoot :=  ASN1ASTRoot new.
	(aDirectoryPath asFileReference entries) do: [ :entry |
		astRoot addModuleFrom: (
			entry readStream 
				converter: (TextConverter newForEncoding: anEncoding);
				contents) ].
	^ astRoot