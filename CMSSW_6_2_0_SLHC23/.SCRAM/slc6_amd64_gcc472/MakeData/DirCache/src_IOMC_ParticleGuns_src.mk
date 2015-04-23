ifeq ($(strip $(IOMC/ParticleGuns)),)
ALL_COMMONRULES += src_IOMC_ParticleGuns_src
src_IOMC_ParticleGuns_src_parent := IOMC/ParticleGuns
src_IOMC_ParticleGuns_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_IOMC_ParticleGuns_src,src/IOMC/ParticleGuns/src,LIBRARY))
IOMCParticleGuns := self/IOMC/ParticleGuns
IOMC/ParticleGuns := IOMCParticleGuns
IOMCParticleGuns_files := $(patsubst src/IOMC/ParticleGuns/src/%,%,$(wildcard $(foreach dir,src/IOMC/ParticleGuns/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
IOMCParticleGuns_BuildFile    := $(WORKINGDIR)/cache/bf/src/IOMC/ParticleGuns/BuildFile
IOMCParticleGuns_LOC_USE := self  boost FWCore/Framework SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord clhep hepmc heppdt
IOMCParticleGuns_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,IOMCParticleGuns,IOMCParticleGuns,$(SCRAMSTORENAME_LIB),src/IOMC/ParticleGuns/src))
IOMCParticleGuns_PACKAGE := self/src/IOMC/ParticleGuns/src
ALL_PRODS += IOMCParticleGuns
IOMCParticleGuns_CLASS := LIBRARY
IOMC/ParticleGuns_forbigobj+=IOMCParticleGuns
IOMCParticleGuns_INIT_FUNC        += $$(eval $$(call Library,IOMCParticleGuns,src/IOMC/ParticleGuns/src,src_IOMC_ParticleGuns_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
