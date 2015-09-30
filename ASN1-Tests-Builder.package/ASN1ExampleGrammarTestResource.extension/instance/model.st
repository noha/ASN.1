*ASN1-Tests-Builder
model
	^ model ifNil: [
		model := self ast buildModel: ASN1CachedModelRoot ]