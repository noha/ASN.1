visiting
nextTagged: aTag on: aStream with: aCollection
	|  element extensionPosition |
	extensionPosition := -1.
	[ aStream atEnd ] whileFalse: [
		element := aStream next.
		(element isKindOf: ASN1Extension)
			ifTrue: [ extensionPosition := aStream position - 1  ]
			ifFalse: [  
				(element value includesTag: aTag)
					ifTrue: [ ^ element ]
					ifFalse: [  
						[ self checkOptionalAndDefault: element with: aCollection  ]
							on: ASN1MandatoryElementNotFound 
							do: [ :error |
								(extensionPosition >= 0) 
								 	ifTrue: [  
										"abort and rewind stream to last position."
										aStream position: extensionPosition. 
										^ nil ].
									error pass ] ] ] ].
	(ASN1ElementNotFound new 
		messageText: 'premature end of sequence while looking for tag ',  aTag printString) signal