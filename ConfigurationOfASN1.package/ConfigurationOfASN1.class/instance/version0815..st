versions
version0815: spec
	<version: '0.8.15' imports: #('0.8.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.14 : fixed a bug where a module is build wrongly from the AST. Changed oid handling. Now all fields that hold an oid should be of type ASN1Oid
0.8.15 : unified ASN1Oid handling. String instVar is removed and accesses are using value now'.
		spec author: 'NorbertHartl'.
		spec timestamp: '1/21/2014 15:32'.
		spec 
			project: 'PetitParser' with: '1.8-snapshot';
			project: 'PetitParser Tests' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.10';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-HolgerHansPeterFreyther.70';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.10';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.67';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.15';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.6';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.35';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.53';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.11'. ].
