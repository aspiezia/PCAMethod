#ifndef _PCAFFUNCTYPE_INC_ 
#define _PCAFFUNCTYPE_INC_

#include <armadillo>
#include <vector>
#include <map>

// to be moved
#define ONEOVERPTIDX 0
#define PHIIDX 1
#define D0IDX 2
#define COTTETHAIDX 3
#define Z0IDX 4

#define SPLIT_COTTETHAIDX 0
#define SPLIT_Z0IDX 1

#define SPLIT_ONEOVERPTIDX 0
#define SPLIT_PHIIDX 1

#define ETAMIN -0.800e0
#define ETAMAX -0.100e0

namespace pca
{
  int numofline (const char * fname);

  void write_to_file (const char * fname, 
      const arma::mat & vec, int idx);
  
  void write_armmat (const char *, arma::mat & cmtx);
  
  void write_armvct (const char *, arma::rowvec & q);
  
  void read_armmat (const char *, arma::mat & cmtx);
  
  void read_armvct (const char *, arma::rowvec & q);

  void reading_from_file (const char * filename, 
          arma::mat & paramin, arma::mat & coordin,
          arma::mat & layer, arma::mat & ladder, 
          arma::mat & module, 
          std::map<std::string, int> & subsectors, 
          std::map<std::string, int> & subladders,
          std::vector<std::string> & subsectorslist,
          std::vector<std::string> & subladderslist,
          int num_of_ent, bool usesegid, 
          bool useonlyeven, bool useonlyodd);

  bool reading_from_file_split (const pca::pcafitter &, const char * filename, 
          arma::mat & paramin, arma::mat & coordin,
          int num_of_ent, bool useonlyeven, bool useonlyodd, 
          bool rzread, bool rphiread, double etamin,
          double etamax, bool chargeoverpt);

  bool file_exists(const std::string& filename);

  double delta_phi(double phi1, double phi2);

  double cot (double);

  double atanall (double);

};
  
#endif
