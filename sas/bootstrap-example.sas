/*
   ------------------------------------------
  | SAS-FLOW                                 |
  | Version 1.0                              |
  | http://epidemiology.github.io/sas-flow/  |
   ------------------------------------------


  This file defines the location of your project and the name of your data
  library for this project.

  Setup instructions:
  -------------------

    1. Save this file in the same folder as `bootstrap.sas.`
    2. Set the path name below.
    3. Set your library name below.

  Running instructions:
  ---------------------

  Run this file first whenever you start a new SAS session to set up your paths
  and library.

  After you run it once, until you close SAS you can just run `master.sas`
  directly to execute all your code.

*/


/* MODIFY THE NEXT TWO LINES: */
x 'cd c:\REPLACE_WITH_PATH_TO_PROJECT\sas';
libname REPLACE_WITH_LIBRARY_NAME "..\data";

/* DON'T CHANGE ANYTHING BELOW THIS LINE. */
%include 'lib\preflight.sas';

