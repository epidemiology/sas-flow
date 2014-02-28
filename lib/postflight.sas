/*
   ------------------------------------------
  | SAS-FLOW                                 |
  | Version 1.0                              |
  | http://epidemiology.github.io/sas-flow/  |
   ------------------------------------------

  This file runs at the end of `master.sas`. It restores normal output
  for easier debugging via running code directly in SAS.

  Do not modify anything in this file unless you know what you're doing.
*/

ods results on;
proc printto;
