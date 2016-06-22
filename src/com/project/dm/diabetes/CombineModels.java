/*
 *  How to use WEKA API in Java 
 *  Copyright (C) 2014 
 *  @author Dr Noureddin M. Sadawi (noureddin.sadawi@gmail.com)
 *  
 *  This program is free software: you can redistribute it and/or modify
 *  it as you wish ... 
 *  I ask you only, as a professional courtesy, to cite my name, web page 
 *  and my YouTube Channel!
 *  
 */

package com.project.dm.diabetes;
import java.util.Random;

//import required classes
import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.meta.AdaBoostM1;
import weka.classifiers.meta.Bagging;
import weka.classifiers.meta.Stacking;
import weka.classifiers.meta.Vote;
import weka.classifiers.trees.DecisionStump;
import weka.classifiers.trees.J48;
import weka.classifiers.trees.RandomForest;
import weka.classifiers.trees.RandomTree;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

public class CombineModels {
	public static void main(String[] args) throws Exception {
		//load dataset
		String data = "/Project-Medification/DataBase/diabetes/bagging/trainafilterdiabetes.arff";
		DataSource source = new DataSource(data);
		//get instances object 
		Instances trainingData = source.getDataSet();
		//set class index .. as the last attribute
		if (trainingData.classIndex() == -1) {
			trainingData.setClassIndex(trainingData.numAttributes() - 1);
		}
		
		/* Boosting a weak classifier using the Adaboost M1 method
		 * for boosting a nominal class classifier
		 * Tackles only nominal class problems
		 * Improves performance
		 * Sometimes overfits.
		 */
		//AdaBoost .. 
		AdaBoostM1 m1 = new AdaBoostM1();
		m1.setClassifier(new J48());//needs one base-classifier
		m1.setNumIterations(20);
		m1.buildClassifier(trainingData);
		
		
		Evaluation eval1 = new Evaluation(trainingData);
		Random rand = new Random(1);
		int folds = 10;
		
		DataSource src1 = new DataSource("/Project-Medification/DataBase/diabetes/bagging/testafilterdiabetes.arff");
		Instances testDataset = src1.getDataSet();
		testDataset.setClassIndex(testDataset.numAttributes()-1);
		//now evaluate model
		eval1.evaluateModel(m1, testDataset);
		eval1.crossValidateModel(m1, testDataset, folds, rand);
		System.out.println(eval1.toSummaryString("Evaluation results:\n", false));
		
		System.out.println("Correct % = "+eval1.pctCorrect());
		System.out.println("Incorrect % = "+eval1.pctIncorrect());
		System.out.println("AUC = "+eval1.areaUnderROC(1));
		System.out.println("kappa = "+eval1.kappa());
		System.out.println("MAE = "+eval1.meanAbsoluteError());
		System.out.println("RMSE = "+eval1.rootMeanSquaredError());
		System.out.println("RAE = "+eval1.relativeAbsoluteError());
		System.out.println("RRSE = "+eval1.rootRelativeSquaredError());
		System.out.println("Precision = "+eval1.precision(1));
		System.out.println("Recall = "+eval1.recall(1));
		System.out.println("fMeasure = "+eval1.fMeasure(1));
		System.out.println("Error Rate = "+eval1.errorRate());
	    //the confusion matrix
		System.out.println(eval1.toMatrixString("=== Overall Confusion Matrix ===\n"));
		
		
		
		
		
		
		
		
		/* Bagging a classifier to reduce variance.
		 * Can do classification and regression (depending on the base model)
		 */
		//Bagging .. 
		Bagging bagger = new Bagging();
		bagger.setClassifier(new J48());//needs one base-model
		bagger.setNumIterations(15);
		bagger.buildClassifier(trainingData);	
		
		
		
		Evaluation eval11 = new Evaluation(trainingData);
		Random rand1 = new Random(1);
		int folds1 = 9;
		
		DataSource src11 = new DataSource("/Project-Medification/DataBase/diabetes/bagging/testafilterdiabetes.arff");
		Instances testDataset1 = src11.getDataSet();
		testDataset1.setClassIndex(testDataset1.numAttributes()-1);
		//now evaluate model
		eval11.evaluateModel(bagger, testDataset1);
		eval11.crossValidateModel(bagger, testDataset1, folds1, rand1);
		System.out.println(eval11.toSummaryString("Evaluation results:\n", false));
		
		System.out.println("Correct % = "+eval11.pctCorrect());
		System.out.println("Incorrect % = "+eval11.pctIncorrect());
		System.out.println("AUC = "+eval11.areaUnderROC(1));
		System.out.println("kappa = "+eval11.kappa());
		System.out.println("MAE = "+eval11.meanAbsoluteError());
		System.out.println("RMSE = "+eval11.rootMeanSquaredError());
		System.out.println("RAE = "+eval11.relativeAbsoluteError());
		System.out.println("RRSE = "+eval11.rootRelativeSquaredError());
		System.out.println("Precision = "+eval11.precision(1));
		System.out.println("Recall = "+eval11.recall(1));
		System.out.println("fMeasure = "+eval11.fMeasure(1));
		System.out.println("Error Rate = "+eval11.errorRate());
	    //the confusion matrix
		System.out.println(eval11.toMatrixString("=== Overall Confusion Matrix ===\n"));
		
		
		
		
		
		/*
		 * The Stacking method combines several models
		 * Can do classification or regression. 
		 */
		//Stacking ..
		Stacking stacker = new Stacking();
		stacker.setMetaClassifier(new J48());//needs one meta-model
		Classifier[] classifiers = {				
				new J48(),
				new NaiveBayes(),
				new RandomForest()
		};
		stacker.setClassifiers(classifiers);//needs one or more models
		stacker.buildClassifier(trainingData);
		
		
		Evaluation eval111 = new Evaluation(trainingData);
		Random rand11 = new Random(1);
		int folds11 = 10;
		
		DataSource src111 = new DataSource("/Project-Medification/DataBase/diabetes/bagging/testafilterdiabetes.arff");
		Instances testDataset11 = src111.getDataSet();
		testDataset11.setClassIndex(testDataset11.numAttributes()-1);
		//now evaluate model
		eval111.evaluateModel(stacker, testDataset11);
		eval111.crossValidateModel(stacker, testDataset11, folds11, rand11);
		System.out.println(eval111.toSummaryString("Evaluation results:\n", false));
		
		System.out.println("Correct % = "+eval111.pctCorrect());
		System.out.println("Incorrect % = "+eval111.pctIncorrect());
		System.out.println("AUC = "+eval111.areaUnderROC(1));
		System.out.println("kappa = "+eval111.kappa());
		System.out.println("MAE = "+eval111.meanAbsoluteError());
		System.out.println("RMSE = "+eval111.rootMeanSquaredError());
		System.out.println("RAE = "+eval111.relativeAbsoluteError());
		System.out.println("RRSE = "+eval111.rootRelativeSquaredError());
		System.out.println("Precision = "+eval111.precision(1));
		System.out.println("Recall = "+eval111.recall(1));
		System.out.println("fMeasure = "+eval111.fMeasure(1));
		System.out.println("Error Rate = "+eval111.errorRate());
	    //the confusion matrix
		System.out.println(eval111.toMatrixString("=== Overall Confusion Matrix ===\n"));
		
		
		
		
		
		
		/*
		 * Class for combining classifiers.
		 * Different combinations of probability estimates for classification are available. 
		 */
		//Vote .. 
		/*Vote voter = new Vote();
		voter.setClassifiers(classifiers);//needs one or more classifiers
		voter.buildClassifier(trainingData);
		
		Evaluation eval1111 = new Evaluation(trainingData);
		Random rand111 = new Random(1);
		int folds111 = 10;
		
		DataSource src1111 = new DataSource("/Project-Medification/DataBase/heart/bagging/testafilterheart.arff");
		Instances testDataset111 = src1111.getDataSet();
		testDataset11.setClassIndex(testDataset111.numAttributes()-1);
		//now evaluate model
		eval1111.evaluateModel(voter, testDataset111);
		eval1111.crossValidateModel(voter, testDataset111, folds111, rand111);
		System.out.println(eval1111.toSummaryString("Evaluation results:\n", false));
		
		System.out.println("Correct % = "+eval1111.pctCorrect());
		System.out.println("Incorrect % = "+eval1111.pctIncorrect());
		System.out.println("AUC = "+eval1111.areaUnderROC(1));
		System.out.println("kappa = "+eval1111.kappa());
		System.out.println("MAE = "+eval1111.meanAbsoluteError());
		System.out.println("RMSE = "+eval1111.rootMeanSquaredError());
		System.out.println("RAE = "+eval1111.relativeAbsoluteError());
		System.out.println("RRSE = "+eval1111.rootRelativeSquaredError());
		System.out.println("Precision = "+eval1111.precision(1));
		System.out.println("Recall = "+eval1111.recall(1));
		System.out.println("fMeasure = "+eval1111.fMeasure(1));
		System.out.println("Error Rate = "+eval1111.errorRate());
	    //the confusion matrix
		System.out.println(eval1111.toMatrixString("=== Overall Confusion Matrix ===\n"));*/
		
		
	}
}
