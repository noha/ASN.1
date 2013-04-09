as yet unclassified
loadModuleWithName: aModuleName
	^ self loadModuleWithFilename: aModuleName asString, '.asn'
