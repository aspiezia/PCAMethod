{
  TCanvas * c1 = new TCanvas("c1", "c1", 800, 600);
  const int val = 21;
  Double_t x[val]    = {4,6,8,10,12,14,17.5,22.5,27.5,32.5,37.5,42.5,47.5,55,65,75,85,95,112.5,137.5,175};
  Double_t ex[val]    = {1,1,1,1,1,1,2.5,2.5,2.5,2.5,2.5,2.5,2.5,5,5,5,5,5,12.5,12.5,25};

  //Double_t ONEOVERPTMean[val] = {0.176557,0.165595,0.192638,0.22291,0.244342,0.263182,0.294427,0.324895,0.349291,0.384782,0.396999,0.439859,0.46055,0.492547,0.560407,0.641293,0.560407,0.740326,0.89879,1.10906,1.41183};
  //Double_t eONEOVERPTMean[val] = {0.00481955,0.00556077,0.00548271,0.00609093,0.00677683,0.00664944,0.00683348,0.0073829,0.00744518,0.0077941,0.00794382,0.00817147,0.00835961,0.00859028,0.00893779,0.00927873,0.00893779,0.00997988,0.0101634,0.0107278,0.0129378};
  Double_t ONEOVERPTMean[val] = {2.70336e-05,3.70339e-05,1.45167e-05,1.51407e-06,-1.0726e-05,-1.43069e-05,-8.29694e-05,-0.000129273,-0.00011181,-0.000163436,-0.000208798,-0.000621678,-0.000267302,-0.000339744,-0.00054258,-0.000754107,-0.00054258,-0.000972422,-0.001634,-0.00214935,-0.00234656};
  Double_t eONEOVERPTMean[val] = {1.68693e-05,1.54773e-05,1.3151e-05,1.32514e-05,1.39099e-05,1.33839e-05,1.57418e-05,1.6979e-05,1.79674e-05,1.97973e-05,2.14703e-05,2.82081e-05,2.49e-05,2.94997e-05,3.33187e-05,3.70938e-05,3.33187e-05,4.00484e-05,5.70998e-05,6.27086e-05,0.000106572};
  TGraphErrors *oneoverptMean = new TGraphErrors(val,x,ONEOVERPTMean,ex,eONEOVERPTMean);
  oneoverptMean->SetMarkerStyle(21);
  oneoverptMean->Draw("ALP");
  oneoverptMean->GetXaxis()->SetRangeUser(0,200);
  oneoverptMean->GetYaxis()->SetRangeUser(-0.02,0.02);
  oneoverptMean->SetTitle("");
  oneoverptMean->GetYaxis()->SetTitleOffset(0.85);
  oneoverptMean->GetXaxis()->SetTitleOffset(1);
  oneoverptMean->GetXaxis()->SetTitle("p_{T} [GeV]");
  oneoverptMean->GetYaxis()->SetTitle("c/p_{T} mean");
  oneoverptMean->GetYaxis()->SetTitleSize(0.045);
  oneoverptMean->GetXaxis()->SetTitleSize(0.045);
  oneoverptMean->GetYaxis()->SetLabelSize(0.03);
  oneoverptMean->GetXaxis()->SetLabelSize(0.03);
  c1->SaveAs("oneoverptMean.pdf");

  //Double_t ONEOVERPTRMS[val] = {3.57016,3.93764,4.33791,4.70148,4.94142,5.12367,5.40052,5.68164,5.88567,6.15512,6.27526,6.46006,6.60401,6.78761,7.0652,7.3327,7.0652,7.69439,8.02952,8.4768,9.14088};
  //Double_t eONEOVERPTRMS[val] = {0.00340793,0.00393206,0.00387686,0.00430694,0.00479195,0.00470187,0.004832,0.0052205,0.00526454,0.00551126,0.00561713,0.0057781,0.00591114,0.00607425,0.00631997,0.00656106,0.00631997,0.00705684,0.00718658,0.00758571,0.00914842};
  Double_t ONEOVERPTRMS[val] = {0.00871588,0.00766258,0.00726786,0.00715522,0.0071046,0.00722075,0.00868204,0.00911607,0.00991947,0.0109295,0.0118596,0.0154036,0.0137849,0.0162176,0.0183316,0.0202801,0.0183316,0.0211943,0.0304832,0.0330067,0.0454423};
  Double_t eONEOVERPTRMS[val] = {1.47056e-05,1.31874e-05,1.1163e-05,1.11734e-05,1.15079e-05,1.11453e-05,1.32426e-05,1.41997e-05,1.47553e-05,1.5787e-05,1.69006e-05,1.70326e-05,1.77251e-05,2.31159e-05,2.42723e-05,2.43376e-05,2.42723e-05,2.30713e-05,3.88288e-05,3.88922e-05,8.66123e-05};
  TGraphErrors *oneoverptRMS = new TGraphErrors(val,x,ONEOVERPTRMS,ex,eONEOVERPTRMS);
  oneoverptRMS->SetMarkerStyle(21);
  oneoverptRMS->Draw("ALP");
  oneoverptRMS->GetXaxis()->SetRangeUser(0,200);
  oneoverptRMS->GetYaxis()->SetRangeUser(0,0.1);
  oneoverptRMS->SetTitle("");
  oneoverptRMS->GetYaxis()->SetTitleOffset(0.85);
  oneoverptRMS->GetXaxis()->SetTitleOffset(1);
  oneoverptRMS->GetXaxis()->SetTitle("p_{T} [GeV]");
  oneoverptRMS->GetYaxis()->SetTitle("c/p_{T} sigma");
  oneoverptRMS->GetYaxis()->SetTitleSize(0.045);
  oneoverptRMS->GetXaxis()->SetTitleSize(0.045);
  oneoverptRMS->GetYaxis()->SetLabelSize(0.03);
  oneoverptRMS->GetXaxis()->SetLabelSize(0.03);
  c1->SaveAs("oneoverptRMS.pdf");

}
