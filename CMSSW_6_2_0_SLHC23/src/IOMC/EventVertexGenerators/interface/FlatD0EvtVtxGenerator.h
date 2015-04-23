#ifndef IOMC_FlatD0EvtVtxGenerator_H
#define IOMC_FlatD0EvtVtxGenerator_H

/**
 * Generate event vertices according to a Flat distribution. 
 * Attention: All values are assumed to be cm!
 *
 * $Id: FlatD0EvtVtxGenerator.h,v 1.5 2008/04/04 21:38:24 yumiceva Exp $
 */

#include "IOMC/EventVertexGenerators/interface/BaseEvtVtxGenerator.h"

namespace CLHEP {
   class RandFlat;
}

class FlatD0EvtVtxGenerator : public BaseEvtVtxGenerator 
{
public:
  FlatD0EvtVtxGenerator(const edm::ParameterSet & p);
  virtual ~FlatD0EvtVtxGenerator();

  /// return a new event vertex
  //virtual CLHEP::Hep3Vector* newVertex();
  virtual HepMC::FourVector* newVertex() ;

  virtual TMatrixD* GetInvLorentzBoost() {
	  return 0;
  }

/*  
  /// set min in X in cm
  void minX(double m=0.0);
  /// set min in Y in cm
  void minY(double m=0.0);
*/
  /// set min in Z in cm
  void minZ(double m=0.0);

/*
  /// set max in X in cm
  void maxX(double m=0);
  /// set max in Y in cm
  void maxY(double m=0);
*/
  /// set max in Z in cm
  void maxZ(double m=0);

  void maxD0(double m=0.0);
  void minD0(double m=0.0);

private:
  /** Copy constructor */
  FlatD0EvtVtxGenerator(const FlatD0EvtVtxGenerator &p);
  /** Copy assignment operator */
  FlatD0EvtVtxGenerator&  operator = (const FlatD0EvtVtxGenerator & rhs );
private:
//  double fMinX, fMinY, fMinZ;
//  double fMaxX, fMaxY, fMaxZ;
  double fMinD0, fMinZ;
  double fMaxD0, fMaxZ;
  CLHEP::RandFlat*  fRandom ;
  double fTimeOffset;
};

#endif
