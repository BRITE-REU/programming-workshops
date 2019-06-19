library(ggplot2)
library(reshape2)
library(caret)
library(ROCR)

setwd('/Users/dakot/Code/programming-workshops/source/workshops/05_Machine_learning/')
combined_data <- read.csv('data/GSE53987_combined.csv', row.names=1)


#' create_boxplot
#'
#' Create grouped violin/boxplots for a specified feature.
#'
#' @param dataframe (data.frame): data.frame containing data to plot.
#' @param y_column (string): column name to plot along the y-axis.
#' @param group_column (string): column name for grouping variable.
#' @param facet (string, optional): second grouping variable. Will create
#'     distinct boxplots for each unique value within the column. Boxplots are
#'     stacked in rows. Default is '', and no facet wrapping is applied.
#'
#' @return (gg.ggplot): ggplot object of boxplots
#' @export
#'
#' @examples
#'
#' # plot 'Pmi' accross disease states
#' create_boxplots(combined_data, 'Pmi', 'Disease.state')
#'
#' # plot 'Pmi' accross disease states and tissue types
#' create_boxplots(combined_data, 'Pmi', 'Disease.state', 'Tissue')
create_boxplot <- function(dataframe, y_column, group_column, facet='') {
  boxplots <- ggplot(dataframe, aes_string(x=group_column, y=y_column)) +
              geom_violin(aes_string(fill=group_column), trim=FALSE) +
              geom_boxplot(width=0.1) +
              theme_minimal() +
              theme(axis.text.x = element_text(angle=45, hjust=1))
  if (facet != '' && facet %in% colnames(dataframe)) {
    boxplots <- boxplots + facet_grid(reformulate('.', facet))
  }
  return(boxplots)
}

#' create_scatterplot()
#'
#' Create a scatterplot!
#'
#' @param dataframe (data.frame): data.frame containing data to plot.
#' @param x_column (string): column name for variable to plot along the x-axis.
#' @param y_column (string): column name for variable to plot along the y-axis.
#' @param color_column (string, optional): column name for variable to dictate
#'     dot color. Default is '' with no coloring.
#'
#' @return (gg.ggplot): ggplot object of scatterplot
#' @export
#'
#' @examples
#'
#' # plot 'A1CF' and 'A2M' expression
#' create_scatterplot(combined_data, 'A1CF', 'A2M')
#'
#' # PLOT 'A1CF' and 'A2M' expression with 'Tissue' coloring
#' create_scatterplot(combined_data, 'A1CF', 'A2M', 'Tissue')
create_scatterplot <- function(dataframe, x_column, y_column, color_column='') {
  scatter <- ggplot(dataframe, aes_string(x=x_column, y=y_column))
  if (color_column != '' && color_column %in% colnames(dataframe)) {
    scatter <- scatter + geom_point(aes_string(color=color_column))
  } else {
    scatter <- scatter + geom_point()
  }
  return(scatter)
}

#' create_histogram()
#'
#' Create a histogram!
#'
#' @param dataframe (data.frame): dataframe containing data to plot.
#' @param column (string): column name of variable to plot.
#' @param facet (string, optional): categorical variable to separate data on.
#'     Default is `''` with no separation.
#' @param bins (int, optional): number of bins in histogram. Default is 30.
#'
#' @return (gg.ggplot): ggplot object containing histograms.
#' @export
#'
#' @examples
#'
#' # create histogram of age distributions
#' # create_histogram(combined_data, 'Age')
#' #
#' # create histogram of age distributions segmented by `Gender`
#' # create_histogram(combined_data, 'Age', facet='Gender')
create_histogram <- function(dataframe, column, facet='', bins=30) {
  hist <- ggplot(dataframe, aes_string(column)) +
          geom_histogram(bins=bins,
                         aes(y=..density..))
  if (facet != '' && facet %in% colnames(dataframe)) {
    hist <- hist + facet_grid(reformulate('.', facet))
  }
  return(hist)
}


#' z_center_column()
#'
#' Transform column values to their associated z-scores by 0-centering and
#' scaling feature values.
#'
#' Z = (x - mu) / sigma
#'
#' @param dataframe (data.frame): data.frame containing data to center.
#' @param column_name (string): column name of column to center.
#'
#' @return (vector): z-centered values of `column_name` values in `dataframe`.
#' @export
#'
#' @examples
#' centered_age <- z_center_column(combined_data, 'Age')
z_center_column <- function(dataframe, column_name) {
  return((dataframe[ , column_name] - mean(dataframe[ , column_name])) /
          sd(dataframe[ , column_name]))
}

#' correlation_plot
#'
#' Create a simple correlation heatmap.
#'
#' @param cor_mat (data.frame, data.matrix): square data matrix containing
#'     correlations between variables.
#' @param row_title (string): name of features to plot along the x-axis.
#' @param col_title (string): name of features to plot along the y-axis
#'
#' @return (gg.ggplot)
#' @export
#'
#' @examples
#' # cor_mat <- cor(combined_data[12:22])
#' # correlation_plot(cor_mat, 'Genes', 'Genes')
correlation_plot <- function(cor_mat, row_title, col_title) {
  melted_data <- melt(cor_mat)
  colnames(melted_data)[1:2] <- c(row_title, col_title)
  cor_plot <- ggplot(data=melted_data, aes_string(x = row_title, y=col_title,
                                      fill='value')) +
              geom_tile() +
              theme(axis.text.x = element_text(angle=90, hjust=1))
  return(cor_plot)
}



#' cross_validate_logit_model_example
#'
#' Example of cross-validation implementation using
#' logistic regression to predict Gender from A2M expression
#'
#' @param dataframe (data.frame): data.frame containing both
#' dependent and independent variable.
#'
#' @return NULL
#' @export
#'
#' @examples
#'
#' # cross_validate_logit_model_example(combined_data)
cross_validate_logit_model_example <- function(dataframe) {
  y <- dataframe$Gender
  folds <- caret::createFolds(y, k=10)

  # bind outputted list auc scores to dataframe
  # for future averaging
  metrics <- lapply(1:length(folds), function(i) {
    test_idx <- folds[[i]]  # get current test partition
    test <- dataframe[test_idx, ]
    train_idx <- unlist(folds[c(1:length(folds))[-i]])  # get train partions
    train <- dataframe[train_idx, ]

    # create model --> formula Gender ~ A2m is predicting Gender from
    # A2m expression | Gender ~ . would predict Gender using all features
    model <- glm(Gender ~ A2M, data=train, family=binomial)

    test_pred <- predict(model, test)  # predict test labels from data
    pred_metrics <- ROCR::prediction(test_pred, test$Gender)
    roc_values <- ROCR::performance(pred_metrics, measure = 'tpr', x.measure='fpr')
    auc <- ROCR::performance(pred_metrics, measure='auc')
    auc <- auc@y.values[[1]]
    return(list('fpr' = roc_values@x.values[[1]],
                'tpr' = roc_values@y.values[[1]], 'auc'=auc))
  })

  # Concatenate metrics from different runs
  fpr <- c()
  tpr <- c()
  fold <- c()
  roc <- c()
  for (i in 1:length(metrics)) {
    fpr <- c(fpr, metrics[[i]]$fpr)
    tpr <- c(tpr, metrics[[i]]$tpr)
    roc <- c(roc, metrics[[i]]$auc)
    fold <- c(fold, seq(i, i, length.out=length(metrics[[i]]$fpr)))
  }

  # create data frames for ggplotting
  roc_df <- data.frame('fpr'=fpr, 'tpr'=tpr,'fold'=fold)
  roc_df$fold <- as.factor(roc_df$fold)
  linspace <- seq(from=0, to=1, length.out=1000)
  average_roc <- approx(fpr, tpr, xout=linspace)
  average_df <- data.frame('fpr'=average_roc$x, 'tpr'=average_roc$y)

  # plot roc curve + auc
  mean_auc <- round(mean(auc), 3)
  ggplot(data=roc_df, aes(x=fpr, y=tpr)) +
    geom_line(aes(color=fold), alpha=0.75) +
    geom_line(data=average_df, color='black') +
    ggtitle("ROC Curve", subtitle=paste0('AUC = ',
                                           as.character(mean_auc)))

}