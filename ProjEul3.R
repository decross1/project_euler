## Project Euler Problem 3

# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143?


n <- 13195

test <- 3

if (n %% 2 == 0){
    n <- n / 2
    test <- 2
}

if (n == 1){
    answer <- 2
} else {
    upper.bound <- sqrt(n)
    temp.vec <-
        (test:ceiling(upper.bound))[test:
                                        ceiling(upper.bound) %% 2 == 1]
    
    while (test < upper.bound){
        temp.vec <- temp.vec[n %% temp.vec == 0]
        
        if (length(temp.vec) != 0){
            test <- head(temp.vec, 1)
            n <- n / test
            
            while (n %% test == 0){
                n <- n / test
            }
            upper.bound <- sqrt(n)
            temp.vec <-
                (test:ceiling(upper.bound))[test:
                                                ceiling(upper.bound) %% 2 == 1]
        } else {
            test <- n
        }
    }
    if (n == 1){
        answer <- test
    } else {
        answer <- n
    }
}
