visiting
visitImportNode: aNode 
		^ self 
		provideType: ASN1ObjectIdentifierTypeNode  new
		during: [ super visitImportNode: aNode  ]