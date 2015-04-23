{
  TCanvas * c1 = new TCanvas("c1", "c1", 800, 600);
  const int val = 21;
  Double_t x[val]    = {4,6,8,10,12,14,17.5,22.5,27.5,32.5,37.5,42.5,47.5,55,65,75,85,95,112.5,137.5,175};
  Double_t ex[val]    = {1,1,1,1,1,1,2.5,2.5,2.5,2.5,2.5,2.5,2.5,5,5,5,5,5,12.5,12.5,25};

  //Double_t PHIMean[val] = {-0.000277386,-0.00012443,-0.000130031,-0.000146272,-0.00016757,-0.000152136,-0.000138152,-9.08596e-05,-7.11773e-05,-5.9073e-05,-4.37796e-05,-4.07625e-05,-3.60792e-05,-3.19363e-05,-2.52652e-05,-1.85292e-05,-2.52652e-05,-1.72678e-05,-1.34861e-05,-1.18665e-05,-8.72721e-06};
  //Double_t ePHIMean[val] = {0.000343045,0.000303602,0.000237466,0.000215692,0.000203125,0.000172265,0.000145533,0.000122498,0.000101218,9.0195e-05,7.96527e-05,7.33773e-05,6.75544e-05,6.08892e-05,5.48565e-05,5.05178e-05,5.48565e-05,4.42741e-05,3.99433e-05,3.63234e-05,3.64349e-05};
  Double_t PHIMean[val] = {-5.85988e-06,-1.31473e-06,-6.41281e-07,6.2458e-07,8.98802e-07,7.76222e-07,1.91008e-06,1.96333e-06,1.30486e-06,1.38163e-06,2.28125e-06,1.41635e-06,1.49646e-06,1.91432e-06,2.01422e-06,1.80959e-06,2.01422e-06,2.00872e-06,1.78021e-06,1.618e-06,1.64601e-06};
  Double_t ePHIMean[val] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  TGraphErrors *phiMean = new TGraphErrors(val,x,PHIMean,ex,ePHIMean);
  phiMean->SetMarkerStyle(21);
  phiMean->Draw("ALP");
  phiMean->GetXaxis()->SetRangeUser(0,200);
  phiMean->GetYaxis()->SetRangeUser(-0.001,0.001);
  phiMean->SetTitle("");
  phiMean->GetYaxis()->SetTitleOffset(0.85);
  phiMean->GetXaxis()->SetTitleOffset(1);
  phiMean->GetXaxis()->SetTitle("p_{T} [GeV]");
  phiMean->GetYaxis()->SetTitle("#phi mean");
  phiMean->GetYaxis()->SetTitleSize(0.045);
  phiMean->GetXaxis()->SetTitleSize(0.045);
  phiMean->GetYaxis()->SetLabelSize(0.03);
  phiMean->GetXaxis()->SetLabelSize(0.03);
  c1->SaveAs("phiMean.pdf");

  //Double_t PHIRMS[val] = {0.254117,0.214984,0.187882,0.166489,0.148112,0.132738,0.115015,0.0942711,0.0800172,0.0712289,0.0629225,0.0580105,0.0533692,0.0481146,0.0433688,0.0399305,0.0433688,0.0341457,0.0315732,0.028724,0.0257691};
  //Double_t ePHIRMS[val] = {0.00024257,0.000214679,0.000167914,0.000152518,0.000143631,0.00012181,0.000102907,8.66195e-05,7.15723e-05,6.37775e-05,5.6323e-05,5.18856e-05,4.77682e-05,4.30552e-05,3.87894e-05,3.57215e-05,3.87894e-05,3.13065e-05,2.82442e-05,2.56845e-05,2.57634e-05};
  Double_t PHIRMS[val] = {0.000906843,0.000545997,0.000406352,0.000330246,0.000282371,0.00025082,0.000231739,0.000195118,0.000174007,0.000162774,0.000155578,0.000158773,0.000144443,0.000144974,0.000139215,0.000133302,0.000139215,0.000116976,0.000131757,0.000121178,0.000126968};
  Double_t ePHIRMS[val] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  TGraphErrors *phiRMS = new TGraphErrors(val,x,PHIRMS,ex,ePHIRMS);
  phiRMS->SetMarkerStyle(21);
  phiRMS->Draw("ALP");
  phiRMS->GetXaxis()->SetRangeUser(0,200);
  phiRMS->GetYaxis()->SetRangeUser(0.0,0.005);
  phiRMS->SetTitle("");
  phiRMS->GetYaxis()->SetTitleOffset(0.85);
  phiRMS->GetXaxis()->SetTitleOffset(1);
  phiRMS->GetXaxis()->SetTitle("p_{T} [GeV]");
  phiRMS->GetYaxis()->SetTitle("#phi sigma");
  phiRMS->GetYaxis()->SetTitleSize(0.045);
  phiRMS->GetXaxis()->SetTitleSize(0.045);
  phiRMS->GetYaxis()->SetLabelSize(0.03);
  phiRMS->GetXaxis()->SetLabelSize(0.03);
  c1->SaveAs("phiRMS.pdf");

}
