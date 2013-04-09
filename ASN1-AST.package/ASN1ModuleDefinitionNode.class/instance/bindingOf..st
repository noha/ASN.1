binding
bindingOf: aString
	[ ^ self resolveName: aString ]
	on: Error
	do: [:err| ^ nil ]