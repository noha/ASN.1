versions
version0744: spec
	<version: '0.7.44' imports: #('0.7.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.43 : Changed semantics of errors happening while reading tagged values from a stream. Instead of just throwing an exception the errornous part in the stream emits an error object. This way the structure of the read stays intact only it contains errors. The visitor that converts the tagged values to the key-value structure has gotten a flag skipErrors where it just jumps over an error when detected. This way we can do a recovery read where we try to read as much information as possible to initiate further actions
0.7.44 : new baseline because changing the repository for petit parser'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/7/2013 11:45'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.6';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.63';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.62';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.10';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.32';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.6';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.48';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.8'. ].
