// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// cblas_dgemv_example
NumericMatrix cblas_dgemv_example(NumericMatrix X, NumericVector y, double alpha);
RcppExport SEXP _RCBLAS_cblas_dgemv_example(SEXP XSEXP, SEXP ySEXP, SEXP alphaSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type X(XSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< double >::type alpha(alphaSEXP);
    rcpp_result_gen = Rcpp::wrap(cblas_dgemv_example(X, y, alpha));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_RCBLAS_cblas_dgemv_example", (DL_FUNC) &_RCBLAS_cblas_dgemv_example, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_RCBLAS(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}