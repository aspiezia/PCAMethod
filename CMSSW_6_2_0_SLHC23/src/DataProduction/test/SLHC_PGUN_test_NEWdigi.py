#########################
#
# Configuration file for simple PGUN events
# production in tracker only geometry, using the NEW digitisation
#
# Instruction to run this script are provided on this page:
#
# http://sviret.web.cern.ch/sviret/Welcome.php?n=CMS.HLLHCTuto
#
# Look at STEP II
#
# Author: S.Viret (viret@in2p3.fr)
# Date        : 30/10/2014
#
# Script tested with release CMSSW_6_2_0_SLHC20
#
#########################

import FWCore.ParameterSet.Config as cms

process = cms.Process('SIM')

# import of standard configurations
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_PostLS1_cff')
process.load('Configuration.StandardSequences.Generator_cff')
process.load('Configuration/StandardSequences/VtxSmearedNoSmear_cff')
process.load('GeneratorInterface.Core.genFilterSummary_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')
process.load('L1Trigger.TrackTrigger.TrackTrigger_cff')
process.load('SimTracker.TrackTriggerAssociation.TrackTriggerAssociator_cff')

# Special geometry (Tracker only)
process.load('DataProduction.SkimGeometry.Sim_SKIM_cff')
process.load('DataProduction.SkimGeometry.GeometryExtendedPhase2TkBEReco_SKIM_cff')
process.load('DataProduction.SkimGeometry.mixNoPU_SKIM_cfi')
process.load('DataProduction.SkimGeometry.Digi_SKIM_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(5000)
)

# Input source
process.source = cms.Source("EmptySource")

# Additional output definition
# Other statements
process.genstepfilter.triggerConditions=cms.vstring("generation_step")
from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, 'DES23_62_V1::All', '')

# Random seeds
process.RandomNumberGeneratorService.generator.initialSeed      = 1
process.RandomNumberGeneratorService.VtxSmeared.initialSeed     = 2
process.RandomNumberGeneratorService.g4SimHits.initialSeed      = 3
process.RandomNumberGeneratorService.mix.initialSeed            = 4

# Generate particle gun events

# Generate particle gun events
process.generator = cms.EDProducer("FlatRandomPtGunProducer",
    PGunParameters = cms.PSet(
        MinPt  = cms.double(1.),
        MaxPt  = cms.double(20.),
#	XFlatSpread = cms.double(1.5),  # In mm (requires an update 
#	YFlatSpread = cms.double(1.5),  # In mm  of the official 
#	ZFlatSpread = cms.double(150.), # In mm  PGUN code, see tutorial)
#	towerID= cms.int32(-1),           # Trigger tower ID (put -1 for default params)
        PartID = cms.vint32(-13),
        MinEta = cms.double(-3.5),
        MaxEta = cms.double(3.5),
        MinPhi = cms.double(0.),
	MaxPhi = cms.double(6.28)
    ),
    Verbosity = cms.untracked.int32(0),
    AddAntiParticle = cms.bool(True),
)


# Output definition

process.RAWSIMoutput = cms.OutputModule("PoolOutputModule",
    splitLevel = cms.untracked.int32(0),
    eventAutoFlushCompressedSize = cms.untracked.int32(5242880),
    outputCommands = process.RAWSIMEventContent.outputCommands,
    fileName = cms.untracked.string('PGun_trOnly_example_NewDigi.root'),
    dataset = cms.untracked.PSet(
        filterName = cms.untracked.string(''),
        dataTier = cms.untracked.string('GEN-SIM')
    ),
    SelectEvents = cms.untracked.PSet(
        SelectEvents = cms.vstring('generation_step')
    )
)

process.RAWSIMoutput.outputCommands.append('keep  *_*_MergedTrackTruth_*')

process.generation_step      = cms.Path(process.pgen)
process.simulation_step      = cms.Path(process.psim)
process.genfiltersummary_step= cms.EndPath(process.genFilterSummary)
process.digitisation_step    = cms.Path(process.pdigi)
process.L1TrackTrigger_step  = cms.Path(process.TrackTriggerClustersStubs)
process.L1TTAssociator_step  = cms.Path(process.TrackTriggerAssociatorClustersStubs)
process.endjob_step          = cms.EndPath(process.endOfProcess)
process.RAWSIMoutput_step    = cms.EndPath(process.RAWSIMoutput)

process.schedule = cms.Schedule(process.generation_step,process.genfiltersummary_step,process.simulation_step,process.digitisation_step,process.L1TrackTrigger_step,process.L1TTAssociator_step,process.endjob_step,process.RAWSIMoutput_step)

# filter all path with the production filter sequence
for path in process.paths:
	getattr(process,path)._seq = process.generator * getattr(process,path)._seq
	
# Automatic addition of the customisation function

from SLHCUpgradeSimulations.Configuration.combinedCustoms import customiseBE5DPixel10Ddev
from SLHCUpgradeSimulations.Configuration.combinedCustoms import customise_ev_BE5DPixel10D

process=customiseBE5DPixel10Ddev(process)
process=customise_ev_BE5DPixel10D(process)

# End of customisation functions
