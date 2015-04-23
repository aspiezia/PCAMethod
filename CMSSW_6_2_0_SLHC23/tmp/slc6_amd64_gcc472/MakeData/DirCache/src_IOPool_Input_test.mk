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
