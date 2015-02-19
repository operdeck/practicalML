# practicalML
Practical Machine Learning - Coursera John Hopkins

Plan

1. Get train and test data
2. Divide train data into train/validate
3. Clean up the train data
4. Build model
5. Use validate data for cross validation --> gives out of sample error estimate
6. Apply on test data to predict outcomes

Ad 3:
Many cols have loads of missing data. Using exploratory data analysis we've selected
only the ones that do not have many NA / missing values.

Row 15350 is strange: replace ,,A, with ,NA, so the nr of columns matches in that row


Ad 4:
Creating a simple tree model. Since the outcome is a categorical variable, it makes
more sense to create a classification tree.

