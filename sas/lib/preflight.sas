/* Nice things to run at the beginning of every SAS script. */

* Automatically clear results;
dm 'odsresults; clear';;
dm 'clear log';   /* Clear the log wimdow  */
dm 'clear out';   /* Clear the output file */

ods listing; /* turn listing back on for SAS 9.3 */

* Page settings;
options nodate pageno=1 linesize=80 pagesize=60 source;

/* Put output and log into the same file for easier debugging. */
proc printto print='..\sas\out\sas.sasoutput' log='..\sas\out\sas.sasoutput' new; run;

/* Log and output in separate files: */
/*
proc printto print='..\sas\out\sas.sasoutput' new; run;
proc printto log='..\sas\out\sas.log' new; run;;
*/
