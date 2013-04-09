*asn1-ast
astRootFromAllFilesIn: aDirectoryPath
	"read in all file assuming latin encoding. ASN.1 grammars are unlikely to have much characters
	outside the 7bit range. "
	^ self astRootFromAllFilesIn: aDirectoryPath encoding: 'latin1' 