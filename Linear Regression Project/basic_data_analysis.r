# Loading the data set
data <- read.csv("Linear Regression Project/COPD_student_dataset.csv")

# # Checking if the data set is loaded correctly
# print(dim(data))

# # Check the Column Name
# colNames <- colnames(data)
# print(colNames)

# Loading & Converting Data
# data$COPDSEVERITY <- as.factor(data$COPDSEVERITY)
data$AGEquartiles <- as.factor(data$AGEquartiles)
data$copd <- as.factor(data$copd)
data$gender <- as.factor(data$gender)
data$smoking <- as.factor(data$smoking)
data$Diabetes <- as.factor(data$Diabetes)
data$muscular <- as.factor(data$muscular)
data$hypertension <- as.factor(data$hypertension)
data$AtrialFib <- as.factor(data$AtrialFib)
data$IHD <- as.factor(data$IHD)



# Creating Histogram
# png("Linear Regression Project/histograms/age_histogram.png")
# hist(age)
# dev.off()

# ==================================================================================
# Basic Analysis of continuous variables
# ==================================================================================

# Function for summary of the continuous data
export_summary <- function(summary_data, label){
    capture.output(summary(summary_data),
        file = paste("Linear Regression Project/summary/", label, "_summary.txt"))
}
# Creating Kernel Density Plot
create_density_plot <- function(data, label){
    d <- density(na.omit(data))
    png(paste("Linear Regression Project/density_plot/", label, "_densityPlot.png"))
    plot(d, main=paste("Denisty plot of ", label))
    dev.off()
}
# Function for creating & saving histogram
create_histogram <- function(hist_data, label) {
    png(paste("Linear Regression Project/histograms/", label, "_histogram.png"))
    ifelse(label == "", hist(hist_data),
        hist(hist_data, xlab = label, main = paste("Histogram of ", label))
    )
    dev.off()
}

basic_analysis_continuous <- function(dat, label) {
    export_summary(summary_data = dat, label = label)
    create_histogram(hist_data = dat, label = label)
    create_density_plot(data = dat, label = label)
}

# Execute function for each continuous variables
basic_analysis_continuous(dat = data$AGE, label = "Age")
basic_analysis_continuous(dat = data$PackHistory, label = "Pack History")
basic_analysis_continuous(dat = data$MWT1, label = "MWT1")
basic_analysis_continuous(dat = data$MWT2, label = "MWT2")
basic_analysis_continuous(dat = data$MWT1Best, label = "MWT1Best")
basic_analysis_continuous(dat = data$FEV1, label = "FEV1")
basic_analysis_continuous(dat = data$FEV1PRED, label = "FEV1PRED")
basic_analysis_continuous(dat = data$FVC, label = "FVC")
basic_analysis_continuous(dat = data$FVCPRED, label = "FVCPRED")
basic_analysis_continuous(dat = data$CAT, label = "CAT")
basic_analysis_continuous(dat = data$HAD, label = "HAD")
basic_analysis_continuous(dat = data$SGRQ, label = "SGRQ")

# create_pie <- function(pie_data, title){
#     png(paste("Linear Regression Project/pie_charts/", title, "_pie.png"))
#     pie(pie_data)
#     dev.off()
# }

# create_pie(pie_data = data$Diabetes, title = "AAA")

# print(table(data$COPDSEVERITY))
