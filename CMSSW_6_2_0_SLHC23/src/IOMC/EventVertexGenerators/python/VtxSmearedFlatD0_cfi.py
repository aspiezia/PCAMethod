import FWCore.ParameterSet.Config as cms

from IOMC.EventVertexGenerators.VtxSmearedParameters_cfi import *
VtxSmeared = cms.EDProducer("FlatD0EvtVtxGenerator",
    FlatD0VtxSmearingParameters,
    VtxSmearedCommon
)



