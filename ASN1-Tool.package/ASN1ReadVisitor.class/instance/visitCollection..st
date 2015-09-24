visiting
visitCollection: aCollection
	| value  contentStream elementStream isExtended |
	isExtended := false.
	value := aCollection newValue.
	contentStream := currentTaggedValue elements readStream.
	elementStream := aCollection elements associations readStream.
	[[ elementStream atEnd or: [ contentStream atEnd ] ] whileFalse: [  | element content |
		[ :continue | 
			element := elementStream peek.
			"if next element ist an extension element,mark this sequence as extensible
			and proceed with the next element"
			element value isExtension ifTrue: [ 
				isExtended := true.
				elementStream next.
				continue value ].
			
			content := contentStream peek.
			content isError ifTrue: [  ASN1MandatoryElementNotFound signal  ].
			
			(element value includesTag: content tag) 
				ifTrue: [
					"we have a match so we assign the value"
					self 
						push: content
						during: [ value privAt: element key put:  (self visit: element value) ].
					elementStream next.
					contentStream next ]
				ifFalse: [ 
					element value isOptional  
						ifTrue: [
							element value hasDefaultValue ifTrue: [ 
								"write the default value in the result"
								element value defaultValue isAsn1 
									ifTrue: [ value privAt: element key put: element value defaultValue ]
									ifFalse: [ value at: element key put: element value defaultValue ] ].
							elementStream next  ]						
						ifFalse: [ isExtended ifTrue: [ 
							(aCollection hasElementWithTag: content tag) ifFalse: [
								"if the sequence is extensible and the current content tag is not
								found in the sequence we assume this is an extension value" 
								contentStream next. 
								continue value] ].
							"no escape from checking happened throw error"
							ASN1MandatoryElementNotFound signal ] ]
		] valueWithExit ].

	"after the matching elements phaset here might be still more elements to check.
	These should be optional and/or provide default values"
	[ elementStream atEnd ] whileFalse: [ 
		self checkOptionalAndDefault: elementStream next with: value ] .
	
	"if there are still values left these can only be extensions"
	[ contentStream atEnd ] whileFalse: [ 
		isExtended ifFalse:[ ASN1MandatoryElementNotFound signal] .
		contentStream next.
		 ]] 
	on: ASN1MandatoryElementNotFound 
	do: [ :err | skipErrors ifFalse: [ err pass ] ].
	 
	^ value