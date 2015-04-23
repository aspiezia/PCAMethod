#include "TROOT.h"
#include "TFile.h"
#include "TTree.h"
#include "TBrowser.h"
#include "TH1.h"
#include "TH2.h"
#include "TRandom.h"
#include "TCanvas.h"
#include "TStyle.h"
#include "THStack.h"
#include "TLatex.h"
#include <iostream>

void plot_rz(TString directory="01_pt3To5"){
  gStyle->SetCanvasColor(0);
  gStyle->SetFrameBorderMode(0);
  gStyle->SetOptStat("iRMe");
  gStyle->SetPalette(1,0);
  gStyle->SetLineWidth(0);

  TCanvas * c1 = new TCanvas("c1", "c1", 800, 600);
  TString directoryChar = directory+"/results.txt";
  char* resultsFile = directoryChar;
  FILE *fp = fopen(resultsFile,"r");

  Float_t ptOrigin;
  Float_t ptFitted;
  Float_t ptDiffer;
  Float_t phiOrigin;
  Float_t phiFitted;
  Float_t phiDiffer;
  Float_t etaOrigin;
  Float_t etaFitted;
  Float_t etaDiffer;;
  Float_t z0Origin;
  Float_t z0Fitted;
  Float_t z0Differ;

  TFile *hfile = 0;
  hfile = TFile::Open(directory+"/rz_plane.root","RECREATE");

  TTree *tree = new TTree("tree","tree");
  tree->Branch("etaOrigin",&etaOrigin,"etaOrigin/F");
  tree->Branch("etaFitted",&etaFitted,"etaFitted/F");
  tree->Branch("etaDiffer",&etaDiffer,"etaDiffer/F");
  tree->Branch("z0Origin",&z0Origin,"z0Origin/F");
  tree->Branch("z0Fitted",&z0Fitted,"z0Fitted/F");
  tree->Branch("z0Differ",&z0Differ,"z0Differ/F");

  char line[1000];
  int N = 0;
  
  char buf[1000];
  char *res;
  while(1) {
    res=fgets(buf, 200, fp);
    if(res==NULL) break;
    fscanf(fp,"%f %f %f %f %f %f",&etaOrigin,&etaFitted,&etaDiffer,&z0Origin,&z0Fitted,&z0Differ);
    //cout<<etaOrigin<<" "<<etaFitted<<" "<<etaDiffer<<" "<<z0Origin<<" "<<z0Fitted<<" "<<z0Differ<<" "<<endl;
    tree->Fill();
    //if(N==10) break;
    N=N+1;
  }
  tree->Write();
  fclose(fp);

  tree->Draw("((etaOrigin-etaFitted)/etaOrigin)>>h(200,-1,1)");
  h->GetXaxis()->SetTitle("[#eta(gen) - #eta(fit)]/#eta(gen)");
  h->GetYaxis()->SetTitle("Events");
  h->SetTitle("");
  h->GetYaxis()->SetTitleOffset(0.80);
  h->GetYaxis()->SetTitleSize(0.045);
  h->GetXaxis()->SetTitleSize(0.045);
  h->GetYaxis()->SetLabelSize(0.045);
  h->GetXaxis()->SetLabelSize(0.045);
  h->GetYaxis()->SetTitleOffset(0.8); 
  h->GetYaxis()->SetTitleOffset(0.9); 
  h->GetYaxis()->SetTitleOffset(0.95); 
  h->SetLineWidth(2);
  h->SetLineColor(1);
  h->Draw("histo");
  h->Fit("gaus","V","E1",-0.2,0.2);
  TF1 *myfunc1 = (TF1*)h->GetFunction("gaus");
  c1->SaveAs(directory+"/"+directory+"_eta_diff.pdf");
  ofstream myfile1;
  myfile1.open(directory+"/eta.txt"); 
  myfile1<<"mean meanErr RMS RMSErr"<<endl;
  //myfile1<<h->GetMean()<<" "<<h->GetMeanError()<<" "<<h->GetRMS()<<" "<<h->GetRMSError()<<endl;
  myfile1<<myfunc1->GetParameter("Mean")<<" "<<myfunc1->GetParError(1)<<" "<<myfunc1->GetParameter("Sigma")<<" "<<myfunc1->GetParError(2)<<endl;

  tree->Draw("((z0Origin-z0Fitted)/z0Origin)>>h(200,-1,1)");
  h->GetXaxis()->SetTitle("[z_{0}(gen) - z_{0}(fit)]/z_{0}(gen)");
  h->GetYaxis()->SetTitle("Events");
  h->SetTitle("");
  h->GetYaxis()->SetTitleOffset(0.80);
  h->GetYaxis()->SetTitleSize(0.045);
  h->GetXaxis()->SetTitleSize(0.045);
  h->GetYaxis()->SetLabelSize(0.045);
  h->GetXaxis()->SetLabelSize(0.045);
  h->GetYaxis()->SetTitleOffset(0.8); 
  h->GetYaxis()->SetTitleOffset(0.9); 
  h->GetYaxis()->SetTitleOffset(0.95); 
  h->SetLineWidth(2);
  h->SetLineColor(1);
  h->Draw("histo");
  h->Fit("gaus","V","E1",-0.2,0.2);
  TF1 *myfunc2 = (TF1*)h->GetFunction("gaus");
  c1->SaveAs(directory+"/"+directory+"_z0_diff.pdf");
  ofstream myfile2;
  myfile2.open(directory+"/z0.txt"); 
  myfile2<<"mean meanErr RMS RMSErr"<<endl;
  //myfile2<<h->GetMean()<<" "<<h->GetMeanError()<<" "<<h->GetRMS()<<" "<<h->GetRMSError()<<endl;
  myfile2<<myfunc2->GetParameter("Mean")<<" "<<myfunc2->GetParError(1)<<" "<<myfunc2->GetParameter("Sigma")<<" "<<myfunc2->GetParError(2)<<endl;
}
