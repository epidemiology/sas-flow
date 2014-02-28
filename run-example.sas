/*
   ------------------------------------------
  | SAS-FLOW                                 |
  | Version 1.0                              |
  | http://epidemiology.github.io/sas-flow/  |
   ------------------------------------------


  This file defines the location of your project and the name of your data library for this project.

  Setup instructions:
  -------------------

    1. Save this file in the root folder of your project as  `run.sas.`
    2. Set the path name below.
    3. Set your library name below.

  Running instructions:
  ---------------------

  Run this file in SAS to run all setup code and `.sas` files listed in
  `sas\_manifest.sas`.

  If you are using Sublime Text to edit SAS code (as suggested), you can leave
  this file open in SAS and run it every time you change your code.
*/

/*
  SETUP STEP #2:
  Modify the line below, replacing `REPLACE_WITH_PATH_TO_PROJECT` with the path
  to your project folder on your computer. Note that you must have `\sas` at
  the end, e.g. `c:\Projects\Polio vaccine trial\sas`.
*/
x 'cd "c:\REPLACE_WITH_PATH_TO_PROJECT\sas"';

/*
  SETUP STEP #3:
  Modify the line below, replacing `REPLACE_WITH_LIBRARY_NAME` with the name
  for your SAS library, e.g. `polio`. If you have a file in your `data\` folder
  called `vaccine.sas7bdat`, you will be able to access it with:

      data;
        set polio.vaccine;
        ...
      run;
*/
libname REPLACE_WITH_LIBRARY_NAME "..\data\";











/* DON'T CHANGE ANYTHING BELOW THIS LINE. */
%include '..\lib\preflight.sas';
%include '_manifest.sas';
