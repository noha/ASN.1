versions
version1: spec
	<version: '1' imports: #('0.8.29-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '2/9/2016 19:01'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9';
			project: 'Phexample' with: '2.1'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.186';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.28';
			package: 'ASN1-Codec' with: 'ASN1-Codec-MarcusDenker.53';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.112';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.31';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.15';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.101';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.54';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.22';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.14';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.24'. ].
