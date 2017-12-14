## Copyright (C) 2017 Chingchuan Chen
##
## This file is part of RCBLAS.
##
## RCBLAS is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 2 of the License, or
## (at your option) any later version.
##
## RCBLAS is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with RCBLAS  If not, see <http://www.gnu.org/licenses/>.

LdFlags <- function() {}

#' @importFrom Rcpp Rcpp.plugin.maker
inlineCxxPlugin <-  function() {
  settings <- Rcpp.plugin.maker(
    include.before = "#include <cblas.h>\n#include <cblas_f77.h>",
    libs = sprintf("%s $(BLAS_LIBS) $(FLIBS)"), package = "RBLAS")()
  settings$env$PKG_LIBS <- paste(settings$env$PKG_LIBS, LdFlags())
  settings$env$PKG_CFLAGS <- settings$env$PKG_CFLAGS
  settings$env$PKG_CPPFLAGS <- settings$env$PKG_CPPFLAGS
  return(settings)
}
