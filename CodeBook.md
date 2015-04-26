---
title: "Getting and Cleaning Data Project"
author: "Luis Nuño"
date: "26 de abril de 2015"
output: html_document
---

Variables used:

 - x_train: Data readed from X_train.txt
 - x_test: Data readed from X_test.txt
 - x_total: Merged rows (x_train and x_test)
 
 - y_train: Data readed from y_train.txt
 - y_test: Data readed from y_test.txt
 - y_total: Merged rows (y_train and Y_test). In step 3 the content of each row with be replaced with the real name of the activity

 - subject_train: Data readed from subject_train.txt
 - subject_test: Data readed from subject_test.txt
 - subject_total: Merged rows (subject_train and subject_test)
 
 - feature_labels: Data readed from features.txt
 - activites_labels: Data readed form activity_labels.txt
 
 - mean_std_columns: numbers of rows from features_labels with "mean" or "std" in its descriptuon
 - x_total_mean_std: columns selected from x_total using the numbers of columns related to the rows listed in mean_std_columns

 - merged_data: combining subject, activities(y) and features(x) with cbind
 - merged_data_melt: long format, getting each feature variable in a column