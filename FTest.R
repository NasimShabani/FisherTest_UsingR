install.packages("rjson")
#Load the package required to read JSON files.
library("rjson")

#Read the json File
mydata <- fromJSON(file="https://raw.githubusercontent.com/NasimShabani/FisherTest_UsingR/main/jsonFileTest.json")
mydata

#Convert the JSON to a Data Frame
dataFrame <- data.frame(mydata)
print(dataFrame)

#Extract values from a data frame
mydata[[1]][[1]]

#Observed frequencies
matrixData <- data.frame(
  "variant_yes" = c(mydata[[1]][[1]], mydata[[1]][[3]]),
  "variant_no" = c(mydata[[1]][[2]], mydata[[1]][[4]]),
  row.names = c("Phenotype", "Non-Phenotype"),
  stringsAsFactors = FALSE
)
colnames(matrixData) <- c("Variant", "Non-Variant")
matrixData

#Fisher’s exact test
FTest <- fisher.test(matrixData)
FTest

#Retrieve the p-value
FTest$p.value


