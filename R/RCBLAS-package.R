#' R and CBLAS Integration
#'
#' RCBLAS construct a bridge between R and CBLAS
#'
## Copyright (C) 2010 - 2013 Dirk Eddelbuettel, Romain Francois and Douglas Bates
## Copyright (C) 2014        Dirk Eddelbuettel
## Copyright (C) 2017 Chingchuan Chen
##
## This file is based on RcppEigen-package.Rd and RcppArmadillo-package.Rd
## from RcppArmadillo and RcppEigen.
## This file is part of RCBLAS.
##
## RCBLAS is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 2 of the License, or
## (at your option) any later version.
##
## RCBLAS is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with RCBLAS. If not, see <http://www.gnu.org/licenses/>.

#' R and 'CBLAS' Integration
#'
#' 'RCBLAS' construct a bridge between R and 'CBLAS'.
#'
#' 'CBLAS' provides the C interface to 'BLAS'. Since 'CBLAS' does not be included in R.
#' Therefore, we introduce 'RCBLAS' to R through 'Rcpp'.
#' The 'RCBLAS' package can be used in linking other package required 'CBLAS' in 'Rcpp'.
#' The C interface to 'BLAS' routines included by R are compiled and single precision
#' routine is excluded out. The supported routines of 'BLAS' can be found at
#' 'https://github.com/Chingchuan-chen/RCBLAS/tree/master/src'.
#' The files 'src/*.c' and 'src/*.f' are come from 'LAPACK-3.7.1'.
#'
#' @section Using RCBLAS:
#' The simplest way to get started is to create a skeleton of a package
#' using \code{RCBLAS}. \code{package.skeleton} function is not provided.
#' The important steps are
#' \enumerate{
#' \item Include the \samp{cblas.h} or \samp{cblas_f77.h} header file.
#' \item Import \code{Rcpp}, LinkingTo \code{Rcpp} and \code{RCBLAS} by adding these lines to the \samp{DESCRIPTION} file:
#' \preformatted{
#'   Imports: Rcpp (>= 0.11.0)
#'   LinkingTo: Rcpp, RCBLAS
#' }
#' \item Link against the \code{BLAS} library, by adding following two lines in the \samp{Makevars}  files:
#' \preformatted{
#'   PKG_LIBS = $(BLAS_LIBS) $(FLIBS)
#' }
#' }
#'
#' @author
#' For RCBLAS: Ching-Chuan Chen
#' Maintainer: Ching-Chuan Chen <zw12356@gmail.com>
#'
#' @keywords package interface
#' @docType package
#' @name RCBLAS-package
#' @useDynLib RCBLAS
#' @importFrom Rcpp evalCpp
NULL
