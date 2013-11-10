/* Nice things to run at the beginning of every SAS script. */

* Avoid error on Windows with ODS output;
options helpbrowser=sas;

* Automatically clear results;
dm 'odsresults; clear';;
dm 'clear log';   /* Clear the log wimdow  */
dm 'clear out';   /* Clear the output file */

* Page settings;
options nodate pageno=1 linesize=80 pagesize=60 source;
proc printto print='..\sas\out\sas.sasoutput' new; run;
proc printto log='..\sas\out\sas.log' new; run;;
