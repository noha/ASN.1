versions
version073: spec
	<version: '0.7.3' imports: #('0.7.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.2 : Tried to remove ambiguous names. Changed naming from tlv encoding to tagged values. This is what the objects read from a BER stream really are. Adjusted the facade methods to introduce the tagged value name and removed "Encoded" in method names'.
		spec author: 'NorbertHartl'.
		spec timestamp: '4/22/2013 15:05'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.4';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.56';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.5';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.46';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.4';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.2';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.17';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.1';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.35';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.3'. ].
