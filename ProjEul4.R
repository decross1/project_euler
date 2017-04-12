

##Project Euler Problem 4
# 
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 ?? 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.


#### To vectorize the function with lapply and sapply applications
# list.string <- list('abc',"aa",'aaa','ab')
# list.new  <- lapply(list.string,palindrome)
# vec.new  <- sapply(list.string,palindrome)

# calculate the products of 900:999
mat <- matrix(900:999, nrow = 1)
mat <- t(mat) %*% (mat)
candidate <- as.vector(mat)
candidate <- unique(sort(candidate, decreasing = T))



##above palindrome func cannot be passed as a str, undefined length...............
## redefine palindrome function
is.palindromic <- function(x) {
    x <- as.character(x)
    forward <- unlist(strsplit(x, split = ""))
    reverse <- rev(forward)
    flag <- all(forward == reverse)
    return(flag)
}

# pick the largest palindrome
pali.max <- 0
i <- 1
n <- length(candidate)
while (i <= n) {
    if (is.palindromic(candidate[i])) {
        pali.max <- candidate[i]
        break
    }
    i <- i + 1
}



## Result 906609

## Other Varitions of Palindrome Fucntion builds (Not tested)
##To define a recursive and callable function to check whether or not a string is a Palindrome

palindromecal <- function(str.refined) {
    ans <<- FALSE
    #print(str.refined)
    
    if (nchar(str.refined) %in% c(0,1)){
        
        ans <<- TRUE
        #print('BASE CASE')
        #print(ans)
    }
    else if(substr(str.refined,1,1)==substr(str.refined,nchar(str.refined),nchar(str.refined))) {
        
        #print('RECURSIVE CASE')
        #print(ans)
        str.refined.small <- substr(str.refined,2,nchar(str.refined)-1)
        palindromecal(str.refined.small)
    }
}

palindrome <- function(astr) {
    
    # HK removing blanks and punctuation etc through a pattern 
    # make all to lower case  
    
    regex <- "^[ \t]+|[ \t]+$|\\.|\\'|[ \t]+|,|!|-"
    astr.clean <- gsub(regex,'',astr)
    str.refined <- tolower(astr.clean)
    shortstring <- palindromecal(str.refined)
    return(shortstring)
}



