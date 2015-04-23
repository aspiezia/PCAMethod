#include <stdio.h>

#include <libgffit/gffit.h>

void SVT_Trigger_CPU (tf_arrays_t tfCPU, 
    unsigned int* data_in, int n_words_in) 
{
  int ie, it, iw;
  int i;

  //GF unpack input words and calculate combinations
  // spachhettare le parole indiividua iniziaio e fine
  // e le varie road 
  // READ puo' contenre piu' traccie 
  gf_fep_CPU(tfCPU,n_words_in,data_in);

  //GF fit (usando metodo di costatnti precacolate )
  //       a seconda della traccia sceglie un set di costanti 
  gf_fit(tfCPU);
  // escono piu' possibilita' che poi' vengono scatate se non passa 
  // il taglio da gf comparator 

  //chisq cut and output formatting test se rientra nel chi2 
  gf_comparator(tfCPU);

  printf("in SVT_Trigger_CPU: tfCPU->out->ndata = %.d\n",
      tfCPU->out->ndata);
  for (i=0; i <tfCPU->out->ndata; i++)
  {
    // each word starting with 6 is the end of an empty packet 
    //   thus no data not fitting results
    fprintf(stdout, "in SVT_Trigger_CPU: tfCPU->out->data[%d] = %.6x\n",
        i, tfCPU->out->data[i]);
  }

  gf_finalize(tfCPU);
}

unsigned int getnumoflines (FILE * fp)
{
  unsigned int lines = 0;

  rewind(fp);

  while (EOF != (fscanf(fp, "%*[^\n]"), 
        fscanf(fp, "%*c"))) 
    ++lines;

  rewind(fp);

  return lines;
}

int main (int argc, char ** argv)
{
  unsigned int hexaval, * data_send;
  int k, n_words_in;
  char word[1024]; /* check dimension */
  tf_arrays_t tf;
  char * fileIn;
  FILE * hbout;

  if (argc != 2)
  {
    fprintf (stderr, "%s filename \n", argv[0]);
    return 1;
  }

  fileIn = argv[1];
  
  printf("Opening file %s\n", fileIn);
  if ( (hbout = fopen(fileIn,"r")) == NULL)
  {
    fprintf(stderr, "Cannot open input file\n");
    return 1;
  }

  data_send = (unsigned int *) malloc(
      getnumoflines(hbout)*sizeof(unsigned int));
  if (data_send == NULL)
  {
    fprintf(stderr, "Malloc error\n");
    return 1;
  }

  k=0;
  while(fscanf(hbout, "%s", word) != EOF)
  {
    hexaval = strtol(word, NULL, 16);
    fprintf(stdout, "%.6x\n", hexaval);
    data_send[k] = hexaval;
    k++;
  }

  // check it
  n_words_in = k - 1;

  gf_init(&tf);

  fprintf(stdout, "array initialized \n");

  svtsim_fconread(tf);

  SVT_Trigger_CPU(tf, data_send, n_words_in);

  free (data_send);

  return 0;
}
