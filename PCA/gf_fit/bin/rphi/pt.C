{
  TCanvas * c1 = new TCanvas("c1", "c1", 800, 600);
  const int val = 21;
  Double_t x[val]    = {4,6,8,10,12,14,17.5,22.5,27.5,32.5,37.5,42.5,47.5,55,65,75,85,95,112.5,137.5,175};
  Double_t ex[val]    = {1,1,1,1,1,1,2.5,2.5,2.5,2.5,2.5,2.5,2.5,5,5,5,5,5,12.5,12.5,25};

  Double_t PTMean[val] = {-5.06271e-05,-5.85441e-05,-3.32179e-05,-2.20061e-05,-1.15013e-05,-8.12255e-06,5.31149e-05,9.56769e-05,6.56536e-05,9.758e-05,0.000125571,0.000212632,8.63048e-05,0.000179368,0.000252623,0.000217981,0.000252623,7.29953e-05,0.000654328,0.000315724,0.00123282};
  Double_t ePTMean[val] = {1.68316e-05,1.54637e-05,1.31474e-05,1.32466e-05,1.39063e-05,1.33908e-05,1.57174e-05,1.6956e-05,1.79297e-05,1.97502e-05,2.14079e-05,2.79583e-05,2.48075e-05,2.93042e-05,3.30318e-05,3.66332e-05,3.30318e-05,3.96349e-05,5.56034e-05,6.08039e-05,0.000104472};
  TGraphErrors *ptMean = new TGraphErrors(val,x,PTMean,ex,ePTMean);
  ptMean->SetMarkerStyle(21);
  ptMean->Draw("ALP");
  ptMean->GetXaxis()->SetRangeUser(0,200);
  ptMean->GetYaxis()->SetRangeUser(-0.02,0.02);
  ptMean->SetTitle("");
  ptMean->GetYaxis()->SetTitleOffset(0.85);
  ptMean->GetXaxis()->SetTitleOffset(1);
  ptMean->GetXaxis()->SetTitle("p_{T} [GeV]");
  ptMean->GetYaxis()->SetTitle("p_{T} mean");
  ptMean->GetYaxis()->SetTitleSize(0.045);
  ptMean->GetXaxis()->SetTitleSize(0.045);
  ptMean->GetYaxis()->SetLabelSize(0.03);
  ptMean->GetXaxis()->SetLabelSize(0.03);
  c1->SaveAs("ptMean.pdf");

  Double_t PTRMS[val] = {0.00872871,0.00766655,0.0072716,0.00715657,0.00710607,0.00722667,0.00868355,0.00912112,0.00992652,0.0109396,0.0118672,0.0153971,0.0137856,0.0162433,0.01836,0.0202977,0.01836,0.0211821,0.030556,0.0329925,0.0462124};
  Double_t ePTRMS[val] = {1.46918e-05,1.31915e-05,1.11678e-05,1.11775e-05,1.1519e-05,1.11685e-05,1.3225e-05,1.42031e-05,1.47423e-05,1.57625e-05,1.68579e-05,1.68768e-05,1.76527e-05,2.30258e-05,2.40875e-05,2.40721e-05,2.40875e-05,2.28093e-05,3.7998e-05,3.77338e-05,8.78616e-05};
  TGraphErrors *ptRMS = new TGraphErrors(val,x,PTRMS,ex,ePTRMS);
  ptRMS->SetMarkerStyle(21);
  ptRMS->Draw("ALP");
  ptRMS->GetXaxis()->SetRangeUser(0,200);
  ptRMS->GetYaxis()->SetRangeUser(0,0.1);
  ptRMS->SetTitle("");
  ptRMS->GetYaxis()->SetTitleOffset(0.85);
  ptRMS->GetXaxis()->SetTitleOffset(1);
  ptRMS->GetXaxis()->SetTitle("p_{T} [GeV]");
  ptRMS->GetYaxis()->SetTitle("p_{T} sigma");
  ptRMS->GetYaxis()->SetTitleSize(0.045);
  ptRMS->GetXaxis()->SetTitleSize(0.045);
  ptRMS->GetYaxis()->SetLabelSize(0.03);
  ptRMS->GetXaxis()->SetLabelSize(0.03);
  c1->SaveAs("ptRMS.pdf");

}
