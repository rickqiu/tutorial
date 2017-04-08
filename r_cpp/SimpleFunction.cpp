#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int timesTwo(int x)
{
  return x * 2;
}

// [[Rcpp::export]]
NumericVector add(NumericVector x, NumericVector y)
{
  int n = x.size();
  NumericVector result(n);
  
  for(int i=0; i<n; ++i)
  {
    result[i] = x[i] + y[i];
  }
  
  return result;
}

// [[Rcpp::export]]
NumericVector add2(NumericVector x, NumericVector y)
{
  return x + y;
}

// [[Rcpp::export]]
double fastSum(NumericVector x)
{
  double result = 0;
  for(int i=0; i<x.size(); ++i)
  {
    result += x[i];
  }
  
  return result;
}

// [[Rcpp::export]]
double fastSum2(NumericVector x)
{
  return std::accumulate(x.begin(),x.end(), 0);
}

// [[Rcpp::export]]
double fastSum3(NumericVector x)
{
  return sum(x);
}