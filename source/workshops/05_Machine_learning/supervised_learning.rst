.. _linux_bash:

============================================
 Supervised learning
============================================

Another common learning approach is to learn a predictive model on labeled data to use later to predict new unknown samples. This is referred to as **classification**. 
Classification is applied to the a subset of the data - *train*, and tested on a smaller subset - *test*. So the first step is to split the data into two sets (usually 75% train and 25% test). The purpose of separating some data as test is to later verify the model and ensure we are not over-fitting. The most critical part in classification is to ensure the train data does not *leak* into the test, meaning no information from the train should be secreted to the test - whether at feature selection step or when learning the model.

---------------------------------
Classification models
---------------------------------

**************
Probability
**************
* Naive-bayes
* K nearest neighbors (KNN)

**************
Planes
**************
* Linear regression
* Logistic regression
* SVM


**************
Trees
**************
* Decision tree
* Random forest
* Decision Stump
* Gradient boosted trees


---------------------------------
Parameters
---------------------------------

*********************************
Kernels
*********************************

---------------------------------
Cross validation
---------------------------------

---------------------------------
Fitness of the model
---------------------------------

A classification model is measured by its **fit**: how well does is fit the data. In other words the average error of the predicted labels vs. the actual labels. We could obtain very high fitness by increasing the features. This situation is referred to as over-fitting. This means instead of learning general patterns in the data we are learning noise, such that although we do respectively good on the train dataset, our model will fail to perform well on new data (test set) due to lack of generalization. 
On the contrary, underfitting is when our model is over-generalizing, and thus cannot perform well. Under-fitting is easier to detect because the model has low fitness (low accuracy or precision), while over-fitting can be tempting as you see bloated fitness.

**********************
Nominal labels
**********************

**Confusion matrix** is a table showing out of total samples of each label class how many were predicted of each class:

.. image:: img/confusion_matrix.png

.. code::

   TN=true negative (samples predicted to be in class negative and that was correct)
   TP=true positive (samples predicted to be in class positive and that was correct) 
   FN=true negative (samples predicted to be in class negative and that was incorrect)
   FP=true positive (samples predicted to be in class positive and that was incorrect) 

If you show the performance of the model as a confusion matrix, fitness can be measured by 4 criteria:

* **Accuracy**

.. math::

   \frac{TP + TN}{TP + FP + TN + FN}

* **Precision**

.. math::

   \frac{TP}{TP + FP}

* **Recall or specifity** 

.. math::

   \frac{TP}{TP + FN}

* **Area Under Curve (AUC):** I will not go into detail but AUC measures "the probability that a randomly chosen positive instance higher than a randomly chosen negative one (assuming *positive* ranks higher than *negative*)".

**********************
Numeric labels
**********************
In the case of numeric labels, we have to measure the *error* of the prediction. Here there is not binary true or false prediction but rather how close to the real value did we predict. The fitness measures for numeric values are:

* **mean squared error (MSE)**
.. math::

   MSE = \frac{1}{N} \sum{(label_{predicted} - label_{actual})^2}

* **Root mean squared deviation (RMSD)** 

.. math::

   RMSD = sqrt{\frac{\sum{(label_{predicted} - label_{actual})^2}}{N}}



--------------------------------------------
 semi-supervised learning
--------------------------------------------
