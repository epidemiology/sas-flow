/*
   ------------------------------------------
  | SAS-FLOW                                 |
  | Version 1.0                              |
  | http://epidemiology.github.io/sas-flow/  |
   ------------------------------------------

  This file is run at the beginning of `master.sas` every time it runs. It sets
  output paths, preferences, etc. for sas-flow to work properly.

  Do not modify anything in this file unless you know what you're doing.
*/

* Do not display results in sidebar (keep focus on editor when running);
ods results off;

* Automatically clear results;
dm 'odsresults; clear';; /* Clears results from Results bar */
dm 'clear log';   /* Clear the log wimdow  */
dm 'clear out';   /* Clear the output file */

* Close all output to avoid random graphics getting saved to disk;
ods _all_ close;

* Save HTML output;
ODS html path='..\sas\out' gpath='..\sas\out\images' (url="images/") file='sasout.html';

* Turn on listing output;
ods listing gpath='..\sas\out\images';

* Page settings;
options nodate pageno=1 linesize=80 pagesize=60 source;

/* Put output and log into the same file for easier debugging. */
proc printto print='..\sas\out\sas.sasoutput' log='..\sas\out\sas.sasoutput' new; run;

/* Log and output in separate files: */
/*
proc printto print='out\sas.sasoutput' new; run;
proc printto log='out\sas.log' new; run;;
*/
