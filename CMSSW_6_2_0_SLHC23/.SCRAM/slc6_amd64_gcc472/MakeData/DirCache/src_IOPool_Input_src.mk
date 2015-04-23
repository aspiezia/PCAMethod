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
