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
