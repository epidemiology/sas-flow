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

x 'cd c:\path\to\hypothermia\sas';

ODS html path='c:\path\to\hypothermia\sasout' gpath='c:\path\to\hypothermia\sasout\images' (url="images/") file='sasout.html';
libname hypo "c:\path\to\hypothermia\data";

* Run preflight stuff.;
%include 'preflight.sas'
