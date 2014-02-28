/*
   ------------------------------------------
  | SAS-FLOW                                 |
  | Version 1.0                              |
  | http://epidemiology.github.io/sas-flow/  |
   ------------------------------------------

  This file lists all the SAS code that is run for your project.

  DO NOT run this file directly in SAS. Instead run `run.sas` in the root folder
  of your project. It calls this file.

  DO NOT rename this file.

  `cleaning.sas` and `analysis.sas` are provided as sensible defaults
  for a small project. However, feel free to rename these files, add
  more includes, etc.
*/

/* Edit or add more includes here for data cleaning/analysis as needed. */
* You must have two semicolons on %INCLUDE lines.;
%INCLUDE "cleaning.sas";;
%INCLUDE "analysis.sas";;
* %INCLUDE "another_file.sas";;




%INCLUDE "..\lib\postflight.sas";; /* DON'T CHANGE THIS LINE. */
/* Don't include anything else below this line. */
