package com.project.dm.diabetes;
import weka.core.Instances;

import java.util.Random;
import weka.core.converters.ConverterUtils.DataSource;
import weka.classifiers.Evaluation;
import weka.classifiers.meta.Bagging;
import weka.classifiers.trees.J48;

public class BaggingModel {
	
	public void Mining() throws Exception
	{
				String data = "/Project-Medification/DataBase/diabetes/bagging/trainafilterdiabetes.arff";
				DataSource src = new DataSource(data);
				Instances trainData = src.getDataSet();
				if (trainData.classIndex() == -1) {
					trainData.setClassIndex(trainData.numAttributes() - 1);
				}
				
				
				String[] options = new String[4];
				options[0] = "-P"; options[1] = "90";
				options[2] = "-S"; options[3] = "3";
				
				Bagging bg = new Bagging();
				bg.setClassifier(new J48());//needs one base-model
				bg.setOptions(options);
				bg.setNumIterations(15);
				bg.buildClassifier(trainData);
				
				Evaluation eval1 = new Evaluation(trainData);
				Random rand = new Random(1);
				int folds = 9;
				
				DataSource src1 = new DataSource("/Project-Medification/DataBase/diabetes/bagging/testafilterdiabetes.arff");
				Instances testDataset = src1.getDataSet();
				testDataset.setClassIndex(testDataset.numAttributes()-1);
				//now evaluate model
				eval1.evaluateModel(bg, testDataset);
				eval1.crossValidateModel(bg, testDataset, folds, rand);
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
			
				
				//weka.core.SerializationHelper.write("/Project-Medification/DataBase/diabetes/bagging/dmodel.model", bg);
	}

	public static void main(String args[]) throws Exception{
		
		BaggingModel ob=new BaggingModel();
		ob.Mining();
		
	}
}
