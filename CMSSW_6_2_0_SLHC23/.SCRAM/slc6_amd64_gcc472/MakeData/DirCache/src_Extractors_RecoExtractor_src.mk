ifeq ($(strip $(Extractors/RecoExtractor)),)
ALL_COMMONRULES += src_Extractors_RecoExtractor_src
src_Extractors_RecoExtractor_src_parent := Extractors/RecoExtractor
src_Extractors_RecoExtractor_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Extractors_RecoExtractor_src,src/Extractors/RecoExtractor/src,LIBRARY))
ExtractorsRecoExtractor := self/Extractors/RecoExtractor
Extractors/RecoExtractor := ExtractorsRecoExtractor
ExtractorsRecoExtractor_files := $(patsubst src/Extractors/RecoExtractor/src/%,%,$(wildcard $(foreach dir,src/Extractors/RecoExtractor/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
ExtractorsRecoExtractor_BuildFile    := $(WORKINGDIR)/cache/bf/src/Extractors/RecoExtractor/BuildFile
ExtractorsRecoExtractor_LOC_USE := self  FWCore/Utilities FWCore/Framework DataFormats/Common DataFormats/Luminosity DataFormats/TrackReco clhep boost DQMServices/Core SimDataFormats/TrackerDigiSimLink DataFormats/L1Trigger DataFormats/L1GlobalTrigger DataFormats/SiStripDetId FWCore/ParameterSet Geometry/CaloGeometry Geometry/RPCGeometryBuilder Geometry/CSCGeometryBuilder Geometry/DTGeometryBuilder Geometry/TrackerGeometryBuilder Geometry/Records MagneticField/Records MagneticField/Engine SimDataFormats/Vertex SimDataFormats/TrackingAnalysis SimTracker/Records RecoLocalTracker/ClusterParameterEstimator TrackingTools/TransientTrack TrackingTools/Records RecoTracker/TransientTrackingRecHit rootcintex root SimTracker/TrackAssociation SimTracker/TrackerHitAssociation DQMServices/ClientConfig CondFormats/SiStripObjects RecoLocalTracker/SiStripClusterizer CondFormats/L1TObjects L1Trigger/GlobalTriggerAnalyzer HLTrigger/HLTcore MathMore DataFormats/DetId DataFormats/GeometryVector DataFormats/GeometrySurface DataFormats/L1TrackTrigger
ExtractorsRecoExtractor_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,ExtractorsRecoExtractor,ExtractorsRecoExtractor,$(SCRAMSTORENAME_LIB),src/Extractors/RecoExtractor/src))
ExtractorsRecoExtractor_PACKAGE := self/src/Extractors/RecoExtractor/src
ALL_PRODS += ExtractorsRecoExtractor
ExtractorsRecoExtractor_CLASS := LIBRARY
Extractors/RecoExtractor_forbigobj+=ExtractorsRecoExtractor
ExtractorsRecoExtractor_INIT_FUNC        += $$(eval $$(call Library,ExtractorsRecoExtractor,src/Extractors/RecoExtractor/src,src_Extractors_RecoExtractor_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
