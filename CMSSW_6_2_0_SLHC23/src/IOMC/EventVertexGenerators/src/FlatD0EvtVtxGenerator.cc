
// $Id: FlatD0EvtVtxGenerator.cc,v 1.5 2009/05/25 12:46:04 fabiocos Exp $

#include "IOMC/EventVertexGenerators/interface/FlatD0EvtVtxGenerator.h"
#include "FWCore/Utilities/interface/Exception.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"

#include "CLHEP/Random/RandFlat.h"
#include "CLHEP/Units/GlobalSystemOfUnits.h"
#include "CLHEP/Units/GlobalPhysicalConstants.h"
//#include "CLHEP/Vector/ThreeVector.h"
#include "HepMC/SimpleVector.h"

FlatD0EvtVtxGenerator::FlatD0EvtVtxGenerator(const edm::ParameterSet& p )
: BaseEvtVtxGenerator(p)
{ 
  
  fRandom = new CLHEP::RandFlat(getEngine()) ;
  
/*
  fMinX = p.getParameter<double>("MinX")*cm;
  fMinY = p.getParameter<double>("MinY")*cm;
*/
  fMinZ = p.getParameter<double>("MinZ")*cm;
/*
  fMaxX = p.getParameter<double>("MaxX")*cm;
  fMaxY = p.getParameter<double>("MaxY")*cm;
*/
  fMaxZ = p.getParameter<double>("MaxZ")*cm;
  fMinD0 = p.getParameter<double>("MinD0")*cm;
  fMaxD0 = p.getParameter<double>("MaxD0")*cm;

  fTimeOffset = p.getParameter<double>("TimeOffset")*ns*c_light;

/*  
  if (fMinX > fMaxX) {
    throw cms::Exception("Configuration")
      << "Error in FlatD0EvtVtxGenerator: "
      << "MinX is greater than MaxX";
  }
  if (fMinY > fMaxY) {
    throw cms::Exception("Configuration")
      << "Error in FlatD0EvtVtxGenerator: "
      << "MinY is greater than MaxY";
  }
*/
  if (fMinZ > fMaxZ) {
    throw cms::Exception("Configuration")
      << "Error in FlatD0EvtVtxGenerator: "
      << "MinZ is greater than MaxZ";
  }

  if (fMinD0 > fMaxD0) {
    throw cms::Exception("Configuration")
      << "Error in FlatD0EvtVtxGenerator: "
      << "MinD0 is greater than MaxD0";
  }


}

FlatD0EvtVtxGenerator::~FlatD0EvtVtxGenerator() 
{
  delete fRandom; 
}


//Hep3Vector * FlatD0EvtVtxGenerator::newVertex() {
HepMC::FourVector* FlatD0EvtVtxGenerator::newVertex() {

/*
  double aX,aY,aZ;
  aX = fRandom->fire(fMinX,fMaxX) ;
  aY = fRandom->fire(fMinY,fMaxY) ;
*/
  double aZ;
  aZ = fRandom->fire(fMinZ,fMaxZ) ;

  double aD0, aPhi0;
  aD0 = fRandom->fire(fMinD0,fMaxD0) ;
  aPhi0 = fRandom->fire(0,2*M_PI);

  //if (fVertex == 0) fVertex = new CLHEP::Hep3Vector;
  //fVertex->set(aX,aY,aZ);
  if ( fVertex == 0 ) fVertex = new HepMC::FourVector() ;
  //fVertex->set(aX,aY,aZ,fTimeOffset);
  fVertex->set(aD0*cos(aPhi0),aD0*sin(aPhi0), aZ, fTimeOffset);

  return fVertex;
}

/*
void FlatD0EvtVtxGenerator::minX(double min) 
{
  fMinX = min;
}

void FlatD0EvtVtxGenerator::minY(double min) 
{
  fMinY = min;
}
*/

void FlatD0EvtVtxGenerator::minZ(double min) 
{
  fMinZ = min;
}

/*
void FlatD0EvtVtxGenerator::maxX(double max) 
{
  fMaxX = max;
}

void FlatD0EvtVtxGenerator::maxY(double max) 
{
  fMaxY = max;
}
*/

void FlatD0EvtVtxGenerator::maxZ(double max) 
{
  fMaxZ = max;
}

void FlatD0EvtVtxGenerator::minD0(double min) 
{
  fMinD0 = min;
}

void FlatD0EvtVtxGenerator::maxD0(double max) 
{
  fMaxD0 = max;
}



