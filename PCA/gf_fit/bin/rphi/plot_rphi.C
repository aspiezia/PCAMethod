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

void plot_rphi(TString directory="01_pt3To5"){
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

  TFile *hfile = 0;
  hfile = TFile::Open(directory+"/rz_plane.root","RECREATE");

  TTree *tree = new TTree("tree","tree");
  tree->Branch("ptOrigin",&ptOrigin,"ptOrigin/F");
  tree->Branch("ptFitted",&ptFitted,"ptFitted/F");
  tree->Branch("ptDiffer",&ptDiffer,"ptDiffer/F");
  tree->Branch("phiOrigin",&phiOrigin,"phiOrigin/F");
  tree->Branch("phiFitted",&phiFitted,"phiFitted/F");
  tree->Branch("phiDiffer",&phiDiffer,"phiDiffer/F");

  char line[1000];
  int N = 0;
  
  char buf[1000];
  char *res;
  while(1) {
    res=fgets(buf, 200, fp);
    if(res==NULL) break;
    fscanf(fp,"%f %f %f %f %f %f",&ptOrigin,&ptFitted,&ptDiffer,&phiOrigin,&phiFitted,&phiDiffer);
    //cout<<ptOrigin<<" "<<ptFitted<<" "<<ptDiffer<<" "<<phiOrigin<<" "<<phiFitted<<" "<<phiDiffer<<" "<<endl;
    tree->Fill();
    //if(N==10) break;
    N=N+1;
  }
  tree->Write();
  fclose(fp);

  tree->Draw("((ptOrigin-ptFitted)/ptOrigin)>>h(200,-0.3,0.3)");
  h->GetXaxis()->SetTitle("[c/p_{T}(gen) - c/p_{T}(fit)]/c/p_{T}(gen)");
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
  h->Fit("gaus","V","E1",-0.1,0.1);
  TF1 *myfunc1 = (TF1*)h->GetFunction("gaus");
  c1->SaveAs(directory+"/"+directory+"_oneoverpt_diff.pdf");
  ofstream myfile1;
  myfile1.open(directory+"/oneoverpt.txt"); 
  myfile1<<"mean meanErr RMS RMSErr"<<endl;
  //myfile1<<h->GetMean()<<" "<<h->GetMeanError()<<" "<<h->GetRMS()<<" "<<h->GetRMSError()<<endl;
  myfile1<<myfunc1->GetParameter("Mean")<<" "<<myfunc1->GetParError(1)<<" "<<myfunc1->GetParameter("Sigma")<<" "<<myfunc1->GetParError(2)<<endl;

  tree->Draw("((phiOrigin-phiFitted)/phiOrigin)>>h(100,-0.01,0.01)");
  h->GetXaxis()->SetTitle("[#phi(gen) - #phi(fit)]/#phi(gen)");
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
  h->Fit("gaus","V","E1",-0.004,0.004);
  TF1 *myfunc2 = (TF1*)h->GetFunction("gaus");
  c1->SaveAs(directory+"/"+directory+"_phi_diff.pdf");
  ofstream myfile2;
  myfile2.open(directory+"/phi.txt"); 
  myfile2<<"mean meanErr RMS RMSErr"<<endl;
  //myfile2<<h->GetMean()<<" "<<h->GetMeanError()<<" "<<h->GetRMS()<<" "<<h->GetRMSError()<<endl;
  myfile2<<myfunc2->GetParameter("Mean")<<" "<<myfunc2->GetParError(1)<<" "<<myfunc2->GetParameter("Sigma")<<" "<<myfunc2->GetParError(2)<<endl;

  tree->Draw("((1./ptOrigin-1./ptFitted)/(1./ptOrigin))>>h(200,-0.3,0.3)");
  h->GetXaxis()->SetTitle("[p_{T}(gen) - p_{T}(fit)]/p_{T}(gen)");
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
  h->Fit("gaus","V","E1",-0.1,0.1);
  TF1 *myfunc3 = (TF1*)h->GetFunction("gaus");
  c1->SaveAs(directory+"/"+directory+"_pt_diff.pdf");
  ofstream myfile3;
  myfile3.open(directory+"/pt.txt"); 
  myfile3<<"mean meanErr RMS RMSErr"<<endl;
  //myfile3<<h->GetMean()<<" "<<h->GetMeanError()<<" "<<h->GetRMS()<<" "<<h->GetRMSError()<<endl;
  myfile3<<myfunc3->GetParameter("Mean")<<" "<<myfunc3->GetParError(1)<<" "<<myfunc3->GetParameter("Sigma")<<" "<<myfunc3->GetParError(2)<<endl;
}
