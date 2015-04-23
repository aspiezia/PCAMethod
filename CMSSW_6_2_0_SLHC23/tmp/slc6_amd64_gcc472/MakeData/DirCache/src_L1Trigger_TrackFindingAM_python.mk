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
