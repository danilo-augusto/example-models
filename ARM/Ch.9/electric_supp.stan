data {
  int<lower=0> N;
  vector[N] post_test;
  vector[N] supp;
  vector[N] pre_test;
}
transformed data {
  matrix[N, 2] x = [supp', pre_test']';
}
parameters {
  real alpha;
  vector[2] beta;
  real<lower=0> sigma;
}
model {
  post_test ~ normal_id_glm(x, alpha, beta, sigma);
}
