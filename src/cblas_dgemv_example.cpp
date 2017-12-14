#include <Rcpp.h>
#include "cblas.h"
using namespace Rcpp;

//' Example of cblas_dgemv
//'
//' A function to demo how to use `cblas_dgemv` which perform `z = alpha * X * y + beta * z` with `beta = 0`.
//' This example is based on `https://github.com/Reference-LAPACK/lapack/blob/master/CBLAS/examples/cblas_example1.c`.
//'
//' @param X A matrix.
//' @param y A vector.
//' @param z A vector.
//' @param alpha Numerics.
//' @return A numeric vector. The result of `alpha * X * y`.
//' @examples
//' X <- matrix(1:6, 3, 2)
//' y <- 1:2
//' all.equal(cblas_dgemv_example(X, y), X %*% y) # TRUE
//' @export
// [[Rcpp::export]]
NumericMatrix cblas_dgemv_example(NumericMatrix X, NumericVector y, double alpha = 1) {
  CBLAS_LAYOUT Layout = CblasColMajor;
  CBLAS_TRANSPOSE transa = CblasNoTrans;
  int m = X.nrow(), n = X.ncol(), lda = X.nrow(), incx = 1, incy = 1;
  double beta = 0.0;
  NumericMatrix z(X.nrow(), 1);
  cblas_dgemv(Layout, transa, m, n, alpha, X.begin(), lda, y.begin(), incx, beta, z.begin(), incy );
  return z;
}

