/*
  This file sets up paths and such. You'll need to modify the paths below and then
  save the file as `bootstrap.sas`. Keep `bootstrap-example.sas` around as a
  reference for people new to the project.

  Each SAS file should start with `%include 'bootstrap.sas';` to make sure all
  your paths, libraries, etc. are set up properly.

  When you first start up your SAS session, you'll need to run this file directly
  to make sure your current directory is in the right place for `%includes` to work.
  After that, you can run `analysis.sas` directly.
*/

x 'cd c:\path_to_project\sas';

* Run preflight stuff.;
%include 'lib\preflight.sas'

ODS html path='c:\path_to_project\sas\out' gpath='c:\path_to_project\sas\out\images' (url="images/") file='sasout.html';
libname library_name_goes_here "c:\path_to_project\data";

