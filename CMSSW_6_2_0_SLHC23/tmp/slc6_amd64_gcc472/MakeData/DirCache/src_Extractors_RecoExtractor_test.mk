ALL_COMMONRULES += src_Extractors_RecoExtractor_test
src_Extractors_RecoExtractor_test_parent := Extractors/RecoExtractor
src_Extractors_RecoExtractor_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Extractors_RecoExtractor_test,src/Extractors/RecoExtractor/test,TEST))
