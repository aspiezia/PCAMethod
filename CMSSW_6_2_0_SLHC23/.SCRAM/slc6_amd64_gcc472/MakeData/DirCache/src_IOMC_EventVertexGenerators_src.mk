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
