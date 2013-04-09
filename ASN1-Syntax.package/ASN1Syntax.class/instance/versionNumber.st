X.680 grammar
versionNumber
	"spec:
		VersionNumber ::= empty | number ':'"
	^ (number, $: asParser) optional