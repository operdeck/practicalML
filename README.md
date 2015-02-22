# practicalML
Practical Machine Learning - Coursera John Hopkins

Plan

1. Get train and test data
2. Divide train data into train/validate
3. Clean up the train data
4. Build model
5. Estimate out of sample error
6. Apply on test data to predict outcomes

Ad 3:
Many cols have loads of missing data. Using exploratory data analysis we've selected
only the ones that do not have many NA / missing values.

Row 15350 is strange/misformatted: replaced ,,A, with ,NA, so the nr of columns matches in that row

Ad 4:
Since the outcome is a categorical variable, it makes more sense to create a classification tree.
Started with CART (rpart), but that gave an accuracy of only about 50%. Switching to bagging improved
results a lot - in the 99% range.

Ad 5:
Cross validation is to be used to estimate the out of sample error by applying
the model to the validation set and counting the number of correct predictions.

preds         A    B    C    D    E
         0    0    0    0    0    0
    A    0 2230   11    0    0    0
    B    0    1 1501    8    3    1
    C    0    0    5 1358   10    0
    D    0    0    1    2 1272    4
    E    0    0    0    0    1 1437
[1] 0.9940089

Ad 6:
> predict(model, newdata=testset)
 [1] B A B A A E D B A A B C B A E E A B B B

