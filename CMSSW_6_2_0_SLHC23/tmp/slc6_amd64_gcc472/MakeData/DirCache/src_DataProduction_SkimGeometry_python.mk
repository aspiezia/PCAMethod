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
