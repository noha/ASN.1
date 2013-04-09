as yet unclassified
etsiExample
	^ 'ExampleProtocol DEFINITIONS  ::=

BEGIN
  ExampleProtocolMessage ::= CHOICE {
                             rlcGeneralBroadcastInformation  RlcGeneralBroadcastInformation,
                             rlcDownlinkPhyModeChange        RlcDownlinkPhyModeChange,
                             rlcDownlinkPhyModeChangeAck     RlcDownlinkPhyModeChangeAck,
                             rlcFrequencyList                RlcFrequencyList,
                             rlcConnectionAdditionSetup      RlcConnectionAdditionSetup,
                             rlcConnectionAdditionAck        RlcConnectionAdditionAck  }
 RlcGeneralBroadcastInformation
                        ::= SEQUENCE {
                             duplexMode                      DuplexMode,
                             frameOffset                     FrameOffset,
                             uplinkPowerMaxRangingStart      UplinkPowerMax,
                             infoText                        InfoText   }
  DuplexMode           ::= ENUMERATED {fdd(0), tdd(1)}
  FrameOffset          ::= INTEGER   (0 | 8..20)
  UplinkPowerMax       ::= INTEGER   (10..20)
  InfoText             ::= IA5String (SIZE (0..128))
  RlcFrequencyList     ::= SEQUENCE  (SIZE(32)) OF PairOfCarrierFrequencies
  PairOfCarrierFrequencies
                        ::= SEQUENCE {
                             uplinkCarrierFrequency          CarrierFrequency,
                             downlinkCarrierFrequency        CarrierFrequency }
  CarrierFrequency     ::= INTEGER (0..130000)
END'