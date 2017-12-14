// Copyright (C)  2017         Chingchuan Chen
//
// This file is based on cblas_mangling.h from LAPACK.
// This file is part of RcppLAPACKE.
//
// cblas_mangling.h: mangling for CBLAS
//
// RcppLAPACKE is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// RcppLAPACKE is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with RcppLAPACKE.  If not, see <http://www.gnu.org/licenses/>.

#ifndef RcppLAPACKE__CBLAS_MANGLING__h
#define RcppLAPACKE__CBLAS_MANGLING__h

#include <Rconfig.h>

#ifdef  __cplusplus
extern "C" {
#endif
  
#ifndef F77_GLOBAL
#ifdef HAVE_F77_UNDERSCORE
#define F77_GLOBAL(lcname,UCNAME)  lcname##_
#else
#define F77_GLOBAL(lcname,UCNAME)  lcname
#endif
#endif

#ifdef  __cplusplus
}
#endif

#endif
