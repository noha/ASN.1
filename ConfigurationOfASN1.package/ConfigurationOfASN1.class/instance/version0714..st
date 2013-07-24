versions
version0714: spec
	<version: '0.7.14' imports: #('0.7.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.13 : version bump to hopefully fix versioning again'.
		spec author: 'NorbertHartl'.
		spec timestamp: '7/24/2013 17:03'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.5';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-HolgerHansPeterFreyther.59';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.7';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.52';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.8';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.2';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.18';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.1';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.37';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.4'. ].
