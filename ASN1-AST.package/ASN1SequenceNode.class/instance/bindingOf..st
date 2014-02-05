as yet unclassified
bindingOf: aString 
	elements do: [  :each |
		(each bindingOf: aString) ifNotNil: [ :val |
			^ val ]].
	^ nil