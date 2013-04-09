printing
printOn: aStream
	aStream nextPutAll: 'component type list: '.
	components 
		do: [:each| each printOn: aStream]
		separatedBy: [ aStream nextPutAll: ', ']