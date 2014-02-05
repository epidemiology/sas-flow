/*
   ------------------------------------------
  | SAS-FLOW                                 |
  | Version 1.0                              |
  | http://epidemiology.github.io/sas-flow/  |
   ------------------------------------------

  This is the file that you run in SAS to execute all your code.

  `cleaning.sas` and `analysis.sas` are provided as sensible defaults
  for a small project. However, feel free to rename these files, add
  more includes, etc.
*/

* Yes, you need two semicolons here.;
%INCLUDE "bootstrap.sas";; /* DON'T CHANGE THIS LINE. */




/* Edit or add more includes here for data cleaning/analysis as needed. */
%INCLUDE "cleaning.sas";;
%INCLUDE "analysis.sas";;




%INCLUDE "lib/postflight.sas";; /* DON'T CHANGE THIS LINE. */
/* Don't include anything else below this line. */

/*
  BEST PRACTICE NOTE:

  If you are going to be changing includes frequently, best practice is
  to nest includes to avoid issues with SAS not automatically reloading
  files changed in an external editor.

  For example, you could add `%INCLUDE` statements to `analysis.sas`. When
  you run `master.sas` in SAS, any changes you make to `analysis.sas` or
  files included in `analysis.sas` will run without needing to close and
  re-open a file in SAS.

  In contrast, if you change the `%INCLUDE`s directly in this file, you will
  need to close and re-open `master.sas` in SAS for your changes to be
  reflected.
*/
