package com.project.dm.diabetes;
import weka.core.Instances;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.Random;

import weka.core.converters.ConverterUtils.DataSource;
import weka.classifiers.Evaluation;
import weka.classifiers.trees.J48;
import weka.classifiers.bayes.NaiveBayes;

public class J48DM {
	
	public void Mining() throws Exception
	{
		DataSource source1 = new DataSource("/Project-Medification/DataBase/diabetes/bagging/trainafilterdiabetes.arff");
		Instances trainData = source1.getDataSet();
		if (trainData.classIndex() == -1) {
		trainData.setClassIndex(trainData.numAttributes() - 1);}
		
				J48 tree = new J48();
				tree.buildClassifier(trainData);
				
				Evaluation eval1 = new Evaluation(trainData);
				Random rand = new Random(1);
				int folds = 10;
				
				DataSource src1 = new DataSource("/Project-Medification/DataBase/diabetes/bagging/testafilterdiabetes.arff");
				Instances testDataset = src1.getDataSet();
				//set class index to the last attribute
				testDataset.setClassIndex(testDataset.numAttributes()-1);
				//now evaluate model
				//eval.evaluateModel(tree, testDataset);
				eval1.crossValidateModel(tree, testDataset, folds, rand);
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
				
				
				NaiveBayes nav = new NaiveBayes();
				nav.buildClassifier(trainData);
				
				Evaluation eval11 = new Evaluation(trainData);
				Random rand1 = new Random(1);
				int folds1 = 10;
				
				DataSource src11 = new DataSource("/Project-Medification/DataBase/diabetes/bagging/testafilterdiabetes.arff");
				Instances testDataset1 = src11.getDataSet();
				//set class index to the last attribute
				testDataset1.setClassIndex(testDataset1.numAttributes()-1);
				//now evaluate model
				//eval.evaluateModel(tree, testDataset);
				eval11.crossValidateModel(nav, testDataset1, folds1, rand1);
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
				System.out.println("fMeasure = "+eval1.fMeasure(1));
				System.out.println("Error Rate = "+eval11.errorRate());
			    //the confusion matrix
				System.out.println(eval11.toMatrixString("=== Overall Confusion Matrix ===\n"));
				
				
				
				
				// serialize model
				/* ObjectOutputStream oos = new ObjectOutputStream(
				                            new FileOutputStream("/Project-Medification/DataBase/diabetes/j48/diabetesModel"));
				 oos.writeObject(tree);
				 oos.flush();
				 oos.close();
				*/
			
				//weka.core.SerializationHelper.write("/Project-Medification/DataBase/diabetes/j48/diabetesModel", tree);
				
				
				
				
				
		
	}

	public static void main(String args[]) throws Exception{
		
		J48DM ob=new J48DM();
		ob.Mining();
		
	}
}
