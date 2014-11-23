Xtest <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"") #some 561 column data
Xtrain <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"") # some more
features<-read.table("~/UCI HAR Dataset/features.txt", quote="\"") # labels for the same 
names(Xtest)= features [,2] # applies the given names to our data files...
names(Xtrain)= features [,2] 
Ytrain <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"") # gets the activity keys for eacn of the "train" logs
Ytest<- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"")
Xall = rbind (Xtest,Xtrain)
Ytest =cbind ("test",Ytest)
Ytrain = cbind ("train",Ytrain)
keepcols2 =grep("std()",features[,2])
keepcols1 =grep("mean()",features[,2])
cols = as.numeric (c(keepcols1,keepcols2))
meanstd = subset(Xall,,cols)
 names(Ytest)=c("testgroup","activity")
names(Ytrain)=c("testgroup","activity")
 Ygrouping=rbind(Ytest,Ytrain)
for (j in 1:nrow (Ygrouping)) {

	if (Ygrouping [j,2] == "1"){Ygrouping [j,2]="Walking"}
	if (Ygrouping [j,2] == "2") { Ygrouping [j,2]="Walking Upstairs"}
	if (Ygrouping [j,2] == "3") {Ygrouping [j,2]="Walking Downstairs"}
	if (Ygrouping [j,2] == "4"){Ygrouping [j,2]="Sitting"}
	if (Ygrouping [j,2] == "5") {Ygrouping [j,2]="Standing"}
	if (Ygrouping [j,2] == "6") {Ygrouping [j,2]="Laying"}}

# Ygrouping[31:40,]

 Cleandataset=cbind(Ygrouping,meanstd)
means = aggregate(Cleandataset[,3:ncol(Cleandataset)], list(Cleandataset$activity), mean)
means 
