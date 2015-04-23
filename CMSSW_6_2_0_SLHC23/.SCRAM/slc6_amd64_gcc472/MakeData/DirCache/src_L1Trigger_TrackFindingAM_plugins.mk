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
