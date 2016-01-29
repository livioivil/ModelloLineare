
# Welcome to SigmaPsy, a collection of tools for Psychometry



* * *

## SetUp

To **install** this package (in R):

    #if devtools is not installed yet: 
    # install.packages("devtools") 
    library(devtools)
    install_github("livioivil/SigmaPsy")
    library(SigmaPsy)
    DAS=compute.scale(items.DAS,prop.na=.20,
          params = scale_das_params)
    summary(DAS)
    pairsSigmaPsy(DAS)
* * *
