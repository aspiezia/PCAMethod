{
  TCanvas * c1 = new TCanvas("c1", "c1", 800, 600);
  const int val = 21;
  Double_t x[val]    = {4,6,8,10,12,14,17.5,22.5,27.5,32.5,37.5,42.5,47.5,55,65,75,85,95,112.5,137.5,175};
  Double_t ex[val]    = {1,1,1,1,1,1,2.5,2.5,2.5,2.5,2.5,2.5,2.5,5,5,5,5,5,12.5,12.5,25};

  //Double_t EtaMean[val] = {-0.0932086,-0.0828724,-0.0829899,-0.0800674,-0.0803804,-0.0824309,-0.0849726,-0.0821018,-0.0818584,-0.0800145,-0.0838244,-0.0804637,-0.0845059,-0.0819345,-0.0849425,-0.0836780,-0.0842627,-0.0824669,-0.0822162,-0.0802835,-0.0777223};
  //Double_t eEtaMean[val]    = {0.00628878,0.00561332,0.00558528,0.00558437,0.00557165,0.0055902,0.00564492,0.00560595,0.0055682,0.00559295,0.00561593,0.00557587,0.00563005,0.00559453,0.00561412,0.00562256,0.00561881,0.00589712,0.00560333,0.00560536,0.00573746};
  Double_t EtaMean[val] = {0.000155206,3.02023e-05,9.92393e-05,5.64143e-05,9.59372e-05,0.000166247,0.000131792,0.000150693,0.000170523,0.000139338,0.000200364,0.000190116,0.000253109,0.000165604,0.00022096,0.000164014,0.000210827,0.000235982,0.000235928,0.000173633,0.000160457};
  Double_t eEtaMean[val]    = {3.27186e-05,2.89896e-05,2.8863e-05,2.88568e-05,2.87871e-05,2.91197e-05,2.90189e-05,2.89421e-05,2.91824e-05,2.90036e-05,2.90808e-05,2.90586e-05,2.91007e-05,2.90136e-05,2.91172e-05,2.92147e-05,2.89763e-05,3.06082e-05,2.91556e-05,2.91009e-05,2.98768e-05};
  TGraphErrors *etaMean = new TGraphErrors(val,x,EtaMean,ex,eEtaMean);
  etaMean->SetMarkerStyle(21);
  etaMean->Draw("ALP");
  etaMean->GetXaxis()->SetRangeUser(0,200);
  etaMean->GetYaxis()->SetRangeUser(0.0,0.001);
  etaMean->SetTitle("");
  etaMean->GetYaxis()->SetTitleOffset(0.85);
  etaMean->GetXaxis()->SetTitleOffset(1);
  etaMean->GetXaxis()->SetTitle("p_{T} [GeV]");
  etaMean->GetYaxis()->SetTitle("#eta mean");
  etaMean->GetYaxis()->SetTitleSize(0.045);
  etaMean->GetXaxis()->SetTitleSize(0.045);
  etaMean->GetYaxis()->SetLabelSize(0.03);
  etaMean->GetXaxis()->SetLabelSize(0.03);
  c1->SaveAs("etaMean.pdf");

  //Double_t EtaRMS[val] = {4.7886,4.43929,4.4242,4.4221,4.40635,4.41849,4.46,4.42792,4.40517,4.41884,4.43834,4.4019,4.44689,4.41767,4.43555,4.44499,4.43994,4.42493,4.42832,4.43039,4.42466};
  //Double_t eEtaRMS[val] = {0.00444684,0.00396922,0.00394939,0.00394874,0.00393975,0.00395287,0.00399156,0.003964,0.00393731,0.00395481,0.00397106,0.00394274,0.00398105,0.00395593,0.00396978,0.00397575,0.0039731,0.0041699,0.00396216,0.00396359,0.004057};
  Double_t EtaRMS[val] = {0.0233329,0.0215081,0.0214562,0.0214301,0.0213624,0.0215746,0.0214856,0.0214447,0.0216533,0.0214716,0.0215567,0.0215214,0.0215322,0.0214722,0.0215571,0.0216551,0.021476,0.0215456,0.0215916,0.0215663,0.0216057};
  Double_t eEtaRMS[val] = {3.79896e-05,3.3057e-05,3.30083e-05,3.2895e-05,3.27998e-05,3.3412e-05,3.32973e-05,3.2875e-05,3.33772e-05,3.33028e-05,3.32593e-05,3.30613e-05,3.34258e-05,3.30634e-05,3.32936e-05,3.36918e-05,3.28344e-05,3.47829e-05,3.34478e-05,3.32678e-05,3.42998e-05};
  TGraphErrors *etaRMS = new TGraphErrors(val,x,EtaRMS,ex,eEtaRMS);
  etaRMS->SetMarkerStyle(21);
  etaRMS->Draw("ALP");
  etaRMS->GetXaxis()->SetRangeUser(0,200);
  etaRMS->GetYaxis()->SetRangeUser(0,0.04);
  etaRMS->SetTitle("");
  etaRMS->GetYaxis()->SetTitleOffset(0.85);
  etaRMS->GetXaxis()->SetTitleOffset(1);
  etaRMS->GetXaxis()->SetTitle("p_{T} [GeV]");
  etaRMS->GetYaxis()->SetTitle("#eta sigma");
  etaRMS->GetYaxis()->SetTitleSize(0.045);
  etaRMS->GetXaxis()->SetTitleSize(0.045);
  etaRMS->GetYaxis()->SetLabelSize(0.03);
  etaRMS->GetXaxis()->SetLabelSize(0.03);
  c1->SaveAs("etaRMS.pdf");

}
