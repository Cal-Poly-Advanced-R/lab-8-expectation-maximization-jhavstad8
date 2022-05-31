#' Perform the Expectation-Maximization Algorithm on a dataset
#'
#'
#' @param dat a numeric dataset to perform the algorithm on
#' @param k The number of random observations to start with
#'
#' @return A list with cluster assignments and parameter estimates
#'
#' @examples
#'
#' @import tidyverse
#' @import mvtnorm
#' @export

em_clust <- function(dat,k){
    # e step
    est_means <- dat[sample(nrow(dat),k),]
    cv_mat <- cov(dat)
    probs <- c()
    for(i in 1:k){
    prob <- dmvnorm(x = dat, mean = as.numeric(est_means[k,]), sigma = cv_mat)
    probs <- cbind(probs,prob)
    }
    # find max prob for each observation
    max_p <- apply(probs,1,which.max)
    # add cluster vector to dataset
    c_vect <- as.numeric(max_p)
    dat2 <- cbind(dat, c_vect)
    # m step
    # find cluster means
    c_means <- aggregate(dat2[,1:ncol(dat)], list(dat2$c_vect, FUN = mean))
    # split up dataset by cluster
    clusters <- split(x = dat2, f = c_vect)
    for(i in 1:20){
    new_probs = c()
    for(i in 1:k){
        new_dat <- clusters[i]
        new_dat <- new_dat[,1:ncol(dat)]
        new_mean <- c_means[i,]
        new_mean <- new_mean[,2:ncol(new_mean)]
        update_prob <- dmvnorm(x = new_dat, mean = as.numeric(new_mean), sigma = cov(new_dat))
        new_probs <- cbind(new_probs,update_prob)
    }
    # repeat same steps previously
    max_p <- apply(new_probs,1,which.max)
    c_vect <- as.numeric(max_p)
    dat2 <- cbind(dat, c_vect)
    c_means <- aggregate(dat2[,1:ncol(dat)], list(dat2$c_vect, FUN = mean))
    clusters <- split(x = dat2, f = c_vect)
    }
    return(c_vect)
}

