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
ifeq ($(strip $(IOMC/EventVertexGenerators)),)
ALL_COMMONRULES += src_IOMC_EventVertexGenerators_src
src_IOMC_EventVertexGenerators_src_parent := IOMC/EventVertexGenerators
src_IOMC_EventVertexGenerators_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_IOMC_EventVertexGenerators_src,src/IOMC/EventVertexGenerators/src,LIBRARY))
IOMCEventVertexGenerators := self/IOMC/EventVertexGenerators
IOMC/EventVertexGenerators := IOMCEventVertexGenerators
IOMCEventVertexGenerators_files := $(patsubst src/IOMC/EventVertexGenerators/src/%,%,$(wildcard $(foreach dir,src/IOMC/EventVertexGenerators/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
IOMCEventVertexGenerators_BuildFile    := $(WORKINGDIR)/cache/bf/src/IOMC/EventVertexGenerators/BuildFile
IOMCEventVertexGenerators_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities SimDataFormats/GeneratorProducts boost clhep hepmc CondFormats/DataRecord CondFormats/BeamSpotObjects CondCore/DBOutputService
IOMCEventVertexGenerators_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,IOMCEventVertexGenerators,IOMCEventVertexGenerators,$(SCRAMSTORENAME_LIB),src/IOMC/EventVertexGenerators/src))
IOMCEventVertexGenerators_PACKAGE := self/src/IOMC/EventVertexGenerators/src
ALL_PRODS += IOMCEventVertexGenerators
IOMCEventVertexGenerators_CLASS := LIBRARY
IOMC/EventVertexGenerators_forbigobj+=IOMCEventVertexGenerators
IOMCEventVertexGenerators_INIT_FUNC        += $$(eval $$(call Library,IOMCEventVertexGenerators,src/IOMC/EventVertexGenerators/src,src_IOMC_EventVertexGenerators_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(IOMC/ParticleGuns)),)
ALL_COMMONRULES += src_IOMC_ParticleGuns_src
src_IOMC_ParticleGuns_src_parent := IOMC/ParticleGuns
src_IOMC_ParticleGuns_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_IOMC_ParticleGuns_src,src/IOMC/ParticleGuns/src,LIBRARY))
IOMCParticleGuns := self/IOMC/ParticleGuns
IOMC/ParticleGuns := IOMCParticleGuns
IOMCParticleGuns_files := $(patsubst src/IOMC/ParticleGuns/src/%,%,$(wildcard $(foreach dir,src/IOMC/ParticleGuns/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
IOMCParticleGuns_BuildFile    := $(WORKINGDIR)/cache/bf/src/IOMC/ParticleGuns/BuildFile
IOMCParticleGuns_LOC_USE := self  boost FWCore/Framework SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord clhep hepmc heppdt
IOMCParticleGuns_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,IOMCParticleGuns,IOMCParticleGuns,$(SCRAMSTORENAME_LIB),src/IOMC/ParticleGuns/src))
IOMCParticleGuns_PACKAGE := self/src/IOMC/ParticleGuns/src
ALL_PRODS += IOMCParticleGuns
IOMCParticleGuns_CLASS := LIBRARY
IOMC/ParticleGuns_forbigobj+=IOMCParticleGuns
IOMCParticleGuns_INIT_FUNC        += $$(eval $$(call Library,IOMCParticleGuns,src/IOMC/ParticleGuns/src,src_IOMC_ParticleGuns_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(IOPool/Input)),)
ALL_COMMONRULES += src_IOPool_Input_src
src_IOPool_Input_src_parent := IOPool/Input
src_IOPool_Input_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_IOPool_Input_src,src/IOPool/Input/src,LIBRARY))
IOPoolInput := self/IOPool/Input
IOPool/Input := IOPoolInput
IOPoolInput_files := $(patsubst src/IOPool/Input/src/%,%,$(wildcard $(foreach dir,src/IOPool/Input/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
IOPoolInput_BuildFile    := $(WORKINGDIR)/cache/bf/src/IOPool/Input/BuildFile
IOPoolInput_LOC_USE := self  DataFormats/Common DataFormats/Provenance FWCore/Catalog FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Sources FWCore/Utilities IOPool/Common Utilities/StorageFactory boost clhep rootcore
IOPoolInput_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,IOPoolInput,IOPoolInput,$(SCRAMSTORENAME_LIB),src/IOPool/Input/src))
IOPoolInput_PACKAGE := self/src/IOPool/Input/src
ALL_PRODS += IOPoolInput
IOPoolInput_CLASS := LIBRARY
IOPool/Input_forbigobj+=IOPoolInput
IOPoolInput_INIT_FUNC        += $$(eval $$(call Library,IOPoolInput,src/IOPool/Input/src,src_IOPool_Input_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(L1TriggerTrackFindingAMPlugins)),)
L1TriggerTrackFindingAMPlugins := self/src/L1Trigger/TrackFindingAM/plugins
PLUGINS:=yes
L1TriggerTrackFindingAMPlugins_files := $(patsubst src/L1Trigger/TrackFindingAM/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/L1Trigger/TrackFindingAM/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/L1Trigger/TrackFindingAM/plugins/$(file). Please fix src/L1Trigger/TrackFindingAM/plugins/BuildFile.))))
L1TriggerTrackFindingAMPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/TrackFindingAM/plugins/BuildFile
L1TriggerTrackFindingAMPlugins_LOC_LIB   := boost_serialization boost_program_options boost_iostreams
L1TriggerTrackFindingAMPlugins_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities Geometry/Records MagneticField/Engine MagneticField/Records Geometry/TrackerGeometryBuilder DataFormats/L1TrackTrigger SimDataFormats/TrackingAnalysis L1Trigger/TrackFindingAM hepmc root boost
L1TriggerTrackFindingAMPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerTrackFindingAMPlugins,L1TriggerTrackFindingAMPlugins,$(SCRAMSTORENAME_LIB),src/L1Trigger/TrackFindingAM/plugins))
L1TriggerTrackFindingAMPlugins_PACKAGE := self/src/L1Trigger/TrackFindingAM/plugins
ALL_PRODS += L1TriggerTrackFindingAMPlugins
L1TriggerTrackFindingAMPlugins_CLASS := PLUGINS
L1Trigger/TrackFindingAM_forbigobj+=L1TriggerTrackFindingAMPlugins
L1TriggerTrackFindingAMPlugins_INIT_FUNC        += $$(eval $$(call Library,L1TriggerTrackFindingAMPlugins,src/L1Trigger/TrackFindingAM/plugins,src_L1Trigger_TrackFindingAM_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,L1TriggerTrackFindingAMPlugins,src/L1Trigger/TrackFindingAM/plugins))
endif
ALL_COMMONRULES += src_L1Trigger_TrackFindingAM_plugins
src_L1Trigger_TrackFindingAM_plugins_parent := L1Trigger/TrackFindingAM
src_L1Trigger_TrackFindingAM_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_TrackFindingAM_plugins,src/L1Trigger/TrackFindingAM/plugins,PLUGINS))
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
