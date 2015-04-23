ifeq ($(strip $(L1Trigger/TrackFindingAM)),)
ALL_COMMONRULES += src_L1Trigger_TrackFindingAM_src
src_L1Trigger_TrackFindingAM_src_parent := L1Trigger/TrackFindingAM
src_L1Trigger_TrackFindingAM_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_L1Trigger_TrackFindingAM_src,src/L1Trigger/TrackFindingAM/src,LIBRARY))
L1TriggerTrackFindingAM := self/L1Trigger/TrackFindingAM
L1Trigger/TrackFindingAM := L1TriggerTrackFindingAM
L1TriggerTrackFindingAM_files := $(patsubst src/L1Trigger/TrackFindingAM/src/%,%,$(wildcard $(foreach dir,src/L1Trigger/TrackFindingAM/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
L1TriggerTrackFindingAM_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/TrackFindingAM/BuildFile
L1TriggerTrackFindingAM_LOC_LIB   := boost_serialization boost_program_options boost_iostreams
L1TriggerTrackFindingAM_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CondFormats/DataRecord CondFormats/L1TObjects Geometry/Records Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/DTGeometry Geometry/TrackerGeometryBuilder DataFormats/Common DataFormats/DetId DataFormats/GeometryVector DataFormats/GeometrySurface DataFormats/SiPixelDigi DataFormats/TrackReco DataFormats/VertexReco TrackingTools/TrackAssociator PhysicsTools/CandUtils FWCore/MessageLogger DataFormats/L1Trigger DataFormats/HepMCCandidate TrackingTools/Records TrackingTools/PatternTools TrackingTools/TrajectoryState TrackingTools/GeomPropagators TrackingTools/TransientTrack TrackingTools/TrajectoryParametrization RecoTracker/TrackProducer clhep xerces-c boost root rootrflx DataFormats/SiPixelDetId DataFormats/L1TrackTrigger
L1TriggerTrackFindingAM_EX_LIB   := L1TriggerTrackFindingAM
L1TriggerTrackFindingAM_EX_USE   := $(foreach d,$(L1TriggerTrackFindingAM_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerTrackFindingAM_PACKAGE := self/src/L1Trigger/TrackFindingAM/src
ALL_PRODS += L1TriggerTrackFindingAM
L1TriggerTrackFindingAM_CLASS := LIBRARY
L1Trigger/TrackFindingAM_forbigobj+=L1TriggerTrackFindingAM
L1TriggerTrackFindingAM_INIT_FUNC        += $$(eval $$(call Library,L1TriggerTrackFindingAM,src/L1Trigger/TrackFindingAM/src,src_L1Trigger_TrackFindingAM_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
