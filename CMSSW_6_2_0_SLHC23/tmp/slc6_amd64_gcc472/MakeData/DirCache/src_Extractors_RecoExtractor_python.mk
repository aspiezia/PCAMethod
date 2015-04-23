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
