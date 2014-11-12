accessing
manifest
	^ manifest ifNil: [ 
		manifest := self parseJson: self readManifest ]