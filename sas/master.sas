* Yes, you need two semicolons here.;
%INCLUDE "bootstrap.sas";;

%INCLUDE "cleaning.sas";;
%INCLUDE "analysis.sas";;
/* Add more includes here for cleaning/analysis if necessary. */

%INCLUDE "lib/postflight.sas";;
/* Do not include anything else in this file. */
