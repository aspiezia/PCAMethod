ALL_COMMONRULES += src_L1Trigger_TrackFindingAM_test
src_L1Trigger_TrackFindingAM_test_parent := L1Trigger/TrackFindingAM
src_L1Trigger_TrackFindingAM_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_TrackFindingAM_test,src/L1Trigger/TrackFindingAM/test,TEST))
