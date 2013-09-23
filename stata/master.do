/*
  Sample do file for Stata that uses data saved from SAS.

  TODO make this configurable like bootstrap.sas.
*/

cap log c
shell /Applications/StatTransfer12/st /path/to/sas_to_stata.stcmd

cd /path/to/project
use data/data.dta, clear
set more off

/*
  Add your code here...
*/