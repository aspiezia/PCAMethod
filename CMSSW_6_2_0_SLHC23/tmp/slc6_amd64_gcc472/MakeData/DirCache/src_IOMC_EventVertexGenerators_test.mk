ifeq ($(strip $(VtxSmearingTest)),)
VtxSmearingTest := self/src/IOMC/EventVertexGenerators/test
VtxSmearingTest_files := $(patsubst src/IOMC/EventVertexGenerators/test/%,%,$(foreach file,VtxTester.cc,$(eval xfile:=$(wildcard src/IOMC/EventVertexGenerators/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/IOMC/EventVertexGenerators/test/$(file). Please fix src/IOMC/EventVertexGenerators/test/BuildFile.))))
VtxSmearingTest_BuildFile    := $(WORKINGDIR)/cache/bf/src/IOMC/EventVertexGenerators/test/BuildFile
VtxSmearingTest_LOC_USE := self  FWCore/PluginManager DataFormats/Common FWCore/Framework boost root SimDataFormats/GeneratorProducts
VtxSmearingTest_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,VtxSmearingTest,VtxSmearingTest,$(SCRAMSTORENAME_LIB),src/IOMC/EventVertexGenerators/test))
VtxSmearingTest_PACKAGE := self/src/IOMC/EventVertexGenerators/test
ALL_PRODS += VtxSmearingTest
VtxSmearingTest_CLASS := TEST
VtxSmearingTest_INIT_FUNC        += $$(eval $$(call Library,VtxSmearingTest,src/IOMC/EventVertexGenerators/test,src_IOMC_EventVertexGenerators_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,VtxSmearingTest,src/IOMC/EventVertexGenerators/test))
endif
ifeq ($(strip $(VtxSmearingBoostTest)),)
VtxSmearingBoostTest := self/src/IOMC/EventVertexGenerators/test
VtxSmearingBoostTest_files := $(patsubst src/IOMC/EventVertexGenerators/test/%,%,$(foreach file,BoostTester.cc,$(eval xfile:=$(wildcard src/IOMC/EventVertexGenerators/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/IOMC/EventVertexGenerators/test/$(file). Please fix src/IOMC/EventVertexGenerators/test/BuildFile.))))
VtxSmearingBoostTest_BuildFile    := $(WORKINGDIR)/cache/bf/src/IOMC/EventVertexGenerators/test/BuildFile
VtxSmearingBoostTest_LOC_USE := self  FWCore/PluginManager DataFormats/Common FWCore/Framework boost root SimDataFormats/GeneratorProducts
VtxSmearingBoostTest_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,VtxSmearingBoostTest,VtxSmearingBoostTest,$(SCRAMSTORENAME_LIB),src/IOMC/EventVertexGenerators/test))
VtxSmearingBoostTest_PACKAGE := self/src/IOMC/EventVertexGenerators/test
ALL_PRODS += VtxSmearingBoostTest
VtxSmearingBoostTest_CLASS := TEST
VtxSmearingBoostTest_INIT_FUNC        += $$(eval $$(call Library,VtxSmearingBoostTest,src/IOMC/EventVertexGenerators/test,src_IOMC_EventVertexGenerators_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,VtxSmearingBoostTest,src/IOMC/EventVertexGenerators/test))
endif
ALL_COMMONRULES += src_IOMC_EventVertexGenerators_test
src_IOMC_EventVertexGenerators_test_parent := IOMC/EventVertexGenerators
src_IOMC_EventVertexGenerators_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_IOMC_EventVertexGenerators_test,src/IOMC/EventVertexGenerators/test,TEST))
