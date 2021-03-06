versions
version12: spec
	<version: '1.2' imports: #('1.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '3/8/2018 17:00'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9';
			project: 'Phexample' with: '3.2'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-HolgerHansPeterFreyther.188';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.28';
			package: 'ASN1-Codec' with: 'ASN1-Codec-HolgerHansPeterFreyther.54';
			package: 'ASN1-Tool' with: 'ASN1-Tool-HolgerHansPeterFreyther.113';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.32';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.15';
			package: 'ASN1-AST' with: 'ASN1-AST-HolgerHansPeterFreyther.102';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.54';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.23';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.14';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-HolgerHansPeterFreyther.25'. ].
