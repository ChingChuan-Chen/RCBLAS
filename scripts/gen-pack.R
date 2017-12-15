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

library(pipeR)
library(stringr)

## the version of lapack
lapack_version <- "3.7.1"
filename <- sprintf("lapack-%s", lapack_version)

if (dir.exists("lapack"))
  unlink("lapack", TRUE)
# get filename
f <- paste0("../", filename, ".tgz")
# download file
if (!file.exists(f))
  download.file(sprintf("http://www.netlib.org/lapack/%s.tgz", filename), f, quiet = TRUE)
# remove old dir
if (dir.exists("lapack")) unlink("lapack", recursive = TRUE)
# get the wanted file list
filelist <- untar(f, list = TRUE) %>>%
  `[`(str_detect(., "/CBLAS/|/LAPACKE/")) %>>%
  `[`(!str_detect(., "/\\._")) %>>% `[`(str_detect(., "[^/]+$"))
# uncompress the wanted file list
filelist %>>% split(rep(1:ceiling(length(.) / 300), length = length(.))) %>>%
  lapply(function(fl) untar(f, fl, exdir = "lapack", extras = "--strip-components 1")) %>>% invisible

## copy include files
file.copy("lapack/CBLAS/include/cblas.h", "inst/include/")
file.copy("lapack/CBLAS/include/cblas_f77.h", "inst/include/")
file.copy("lapack/LAPACKE/include/lapacke.h", "inst/include/")
file.copy("lapack/LAPACKE/include/lapacke_utils.h", "inst/include/")
file.copy("lapack/LAPACKE/include/lapacke_config.h", "inst/include/")

## cblas src
if (dir.exists("src/CBLAS/src")) unlink("src/CBLAS/src", TRUE)
if (!dir.exists("src/CBLAS/src")) dir.create("src/CBLAS/src", TRUE)
cblas_src_files <- list.files("lapack/CBLAS/src", full.names = TRUE) %>>%
  (~ tmp <- str_detect(basename(.), "^cblas_[dzgx]|^cblas_i[dz]|^xerbla|^z|^d|^id|^iz")) %>>% `[`(tmp)
cblas_src_files <- setdiff(cblas_src_files,
                           cblas_src_files[str_detect(basename(cblas_src_files), "^cblas_dsd|^dsd")])
invisible(file.copy(cblas_src_files, str_c("src/CBLAS/src/", basename(cblas_src_files))))

