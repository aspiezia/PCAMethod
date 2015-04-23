ALL_SUBSYSTEMS+=DataProduction
subdirs_src_DataProduction = src_DataProduction_SkimGeometry src_DataProduction_batch src_DataProduction_test
ALL_PACKAGES += DataProduction/SkimGeometry
subdirs_src_DataProduction_SkimGeometry := src_DataProduction_SkimGeometry_python
ifeq ($(strip $(PyDataProductionSkimGeometry)),)
PyDataProductionSkimGeometry := self/src/DataProduction/SkimGeometry/python
src_DataProduction_SkimGeometry_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/DataProduction/SkimGeometry/python)
PyDataProductionSkimGeometry_files := $(patsubst src/DataProduction/SkimGeometry/python/%,%,$(wildcard $(foreach dir,src/DataProduction/SkimGeometry/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyDataProductionSkimGeometry_LOC_USE := self  
PyDataProductionSkimGeometry_PACKAGE := self/src/DataProduction/SkimGeometry/python
ALL_PRODS += PyDataProductionSkimGeometry
PyDataProductionSkimGeometry_CLASS := PYTHON
PyDataProductionSkimGeometry_INIT_FUNC        += $$(eval $$(call PythonProduct,PyDataProductionSkimGeometry,src/DataProduction/SkimGeometry/python,src_DataProduction_SkimGeometry_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyDataProductionSkimGeometry,src/DataProduction/SkimGeometry/python))
endif
ALL_COMMONRULES += src_DataProduction_SkimGeometry_python
src_DataProduction_SkimGeometry_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_DataProduction_SkimGeometry_python,src/DataProduction/SkimGeometry/python,PYTHON))
ALL_PACKAGES += DataProduction/batch
subdirs_src_DataProduction_batch := 
ALL_PACKAGES += DataProduction/test
subdirs_src_DataProduction_test := src_DataProduction_test_base
ALL_SUBSYSTEMS+=Extractors
subdirs_src_Extractors = src_Extractors_RecoExtractor
ALL_PACKAGES += Extractors/RecoExtractor
subdirs_src_Extractors_RecoExtractor := src_Extractors_RecoExtractor_python src_Extractors_RecoExtractor_src src_Extractors_RecoExtractor_test
ifeq ($(strip $(PyExtractorsRecoExtractor)),)
PyExtractorsRecoExtractor := self/src/Extractors/RecoExtractor/python
src_Extractors_RecoExtractor_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Extractors/RecoExtractor/python)
PyExtractorsRecoExtractor_files := $(patsubst src/Extractors/RecoExtractor/python/%,%,$(wildcard $(foreach dir,src/Extractors/RecoExtractor/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyExtractorsRecoExtractor_LOC_USE := self  
PyExtractorsRecoExtractor_PACKAGE := self/src/Extractors/RecoExtractor/python
ALL_PRODS += PyExtractorsRecoExtractor
PyExtractorsRecoExtractor_CLASS := PYTHON
PyExtractorsRecoExtractor_INIT_FUNC        += $$(eval $$(call PythonProduct,PyExtractorsRecoExtractor,src/Extractors/RecoExtractor/python,src_Extractors_RecoExtractor_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyExtractorsRecoExtractor,src/Extractors/RecoExtractor/python))
endif
ALL_COMMONRULES += src_Extractors_RecoExtractor_python
src_Extractors_RecoExtractor_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Extractors_RecoExtractor_python,src/Extractors/RecoExtractor/python,PYTHON))
ALL_COMMONRULES += src_Extractors_RecoExtractor_test
src_Extractors_RecoExtractor_test_parent := Extractors/RecoExtractor
src_Extractors_RecoExtractor_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Extractors_RecoExtractor_test,src/Extractors/RecoExtractor/test,TEST))
ALL_SUBSYSTEMS+=HL_LHC
subdirs_src_HL_LHC = src_HL_LHC_IOPool_hack src_HL_LHC_ParticleGuns
ALL_PACKAGES += HL_LHC/IOPool_hack
subdirs_src_HL_LHC_IOPool_hack := 
ALL_PACKAGES += HL_LHC/ParticleGuns
subdirs_src_HL_LHC_ParticleGuns := 
ALL_SUBSYSTEMS+=IOMC
subdirs_src_IOMC = src_IOMC_ParticleGuns src_IOMC_EventVertexGenerators
ALL_PACKAGES += IOMC/EventVertexGenerators
subdirs_src_IOMC_EventVertexGenerators := src_IOMC_EventVertexGenerators_doc src_IOMC_EventVertexGenerators_interface src_IOMC_EventVertexGenerators_python src_IOMC_EventVertexGenerators_src src_IOMC_EventVertexGenerators_test
ifeq ($(strip $(PyIOMCEventVertexGenerators)),)
PyIOMCEventVertexGenerators := self/src/IOMC/EventVertexGenerators/python
src_IOMC_EventVertexGenerators_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/IOMC/EventVertexGenerators/python)
PyIOMCEventVertexGenerators_files := $(patsubst src/IOMC/EventVertexGenerators/python/%,%,$(wildcard $(foreach dir,src/IOMC/EventVertexGenerators/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyIOMCEventVertexGenerators_LOC_USE := self  
PyIOMCEventVertexGenerators_PACKAGE := self/src/IOMC/EventVertexGenerators/python
ALL_PRODS += PyIOMCEventVertexGenerators
PyIOMCEventVertexGenerators_CLASS := PYTHON
PyIOMCEventVertexGenerators_INIT_FUNC        += $$(eval $$(call PythonProduct,PyIOMCEventVertexGenerators,src/IOMC/EventVertexGenerators/python,src_IOMC_EventVertexGenerators_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyIOMCEventVertexGenerators,src/IOMC/EventVertexGenerators/python))
endif
ALL_COMMONRULES += src_IOMC_EventVertexGenerators_python
src_IOMC_EventVertexGenerators_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_IOMC_EventVertexGenerators_python,src/IOMC/EventVertexGenerators/python,PYTHON))
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
ALL_PACKAGES += IOMC/ParticleGuns
subdirs_src_IOMC_ParticleGuns := src_IOMC_ParticleGuns_src
ALL_SUBSYSTEMS+=IOPool
subdirs_src_IOPool = src_IOPool_Input
ALL_PACKAGES += IOPool/Input
subdirs_src_IOPool_Input := src_IOPool_Input_src src_IOPool_Input_test src_IOPool_Input_testdata
ifeq ($(strip $(TestPoolInput)),)
TestPoolInput_files := $(patsubst src/IOPool/Input/test/%,%,$(foreach file,TestPoolInput.cpp,$(eval xfile:=$(wildcard src/IOPool/Input/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/IOPool/Input/test/$(file). Please fix src/IOPool/Input/test/BuildFile.))))
TestPoolInput := self/src/IOPool/Input/test
TestPoolInput_TEST_RUNNER_CMD :=  TestPoolInput  /bin/bash IOPool/Input/test TestPoolInput.sh
TestPoolInput_BuildFile    := $(WORKINGDIR)/cache/bf/src/IOPool/Input/test/BuildFile
TestPoolInput_LOC_USE := self  FWCore/Utilities
TestPoolInput_PACKAGE := self/src/IOPool/Input/test
ALL_PRODS += TestPoolInput
TestPoolInput_CLASS := TEST
TestPoolInput_INIT_FUNC        += $$(eval $$(call Binary,TestPoolInput,src/IOPool/Input/test,src_IOPool_Input_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,TestPoolInput,src/IOPool/Input/test))
endif
ALL_COMMONRULES += src_IOPool_Input_test
src_IOPool_Input_test_parent := IOPool/Input
src_IOPool_Input_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_IOPool_Input_test,src/IOPool/Input/test,TEST))
ALL_SUBSYSTEMS+=L1Trigger
subdirs_src_L1Trigger = src_L1Trigger_TrackFindingAM
ALL_PACKAGES += L1Trigger/TrackFindingAM
subdirs_src_L1Trigger_TrackFindingAM := src_L1Trigger_TrackFindingAM_interface src_L1Trigger_TrackFindingAM_plugins src_L1Trigger_TrackFindingAM_python src_L1Trigger_TrackFindingAM_src src_L1Trigger_TrackFindingAM_test
ifeq ($(strip $(PyL1TriggerTrackFindingAM)),)
PyL1TriggerTrackFindingAM := self/src/L1Trigger/TrackFindingAM/python
src_L1Trigger_TrackFindingAM_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/TrackFindingAM/python)
PyL1TriggerTrackFindingAM_files := $(patsubst src/L1Trigger/TrackFindingAM/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/TrackFindingAM/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerTrackFindingAM_LOC_USE := self  
PyL1TriggerTrackFindingAM_PACKAGE := self/src/L1Trigger/TrackFindingAM/python
ALL_PRODS += PyL1TriggerTrackFindingAM
PyL1TriggerTrackFindingAM_CLASS := PYTHON
PyL1TriggerTrackFindingAM_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerTrackFindingAM,src/L1Trigger/TrackFindingAM/python,src_L1Trigger_TrackFindingAM_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerTrackFindingAM,src/L1Trigger/TrackFindingAM/python))
endif
ALL_COMMONRULES += src_L1Trigger_TrackFindingAM_python
src_L1Trigger_TrackFindingAM_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_TrackFindingAM_python,src/L1Trigger/TrackFindingAM/python,PYTHON))
ALL_COMMONRULES += src_L1Trigger_TrackFindingAM_test
src_L1Trigger_TrackFindingAM_test_parent := L1Trigger/TrackFindingAM
src_L1Trigger_TrackFindingAM_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_TrackFindingAM_test,src/L1Trigger/TrackFindingAM/test,TEST))
ALL_SUBSYSTEMS+=Utils
subdirs_src_Utils = src_Utils_AM_ana src_Utils_FE_ana
ALL_PACKAGES += Utils/AM_ana
subdirs_src_Utils_AM_ana := 
ALL_PACKAGES += Utils/FE_ana
subdirs_src_Utils_FE_ana := 
