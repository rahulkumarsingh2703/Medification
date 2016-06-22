package com.project.dm.diabetes;

import java.io.BufferedReader;
import java.io.FileReader;
import weka.core.DenseInstance;
import weka.core.Instance;
import weka.core.Instances;
import org.apache.log4j.Logger;
import weka.classifiers.Classifier;

public class Prediction {

	static Logger logger = Logger.getLogger(Prediction.class);
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Prediction o=new Prediction();
		
	}

	public String Execute(String s) {
		
		
		
		try {
			
			String rootPath="/Project-Medification/DataBase/diabetes/bagging/"; 
			Classifier cls = (Classifier) weka.core.SerializationHelper.read(rootPath+"dmodel.model");
			
			Instances instances = this.getDataset();
			instances.setClassIndex(instances.numAttributes()-1);
			String signal=s;
			instances.add(getInstanceFromSignal(signal, ","));
			
			
			int s1=0;
				Instance instance = instances.instance(s1);
				
				double result = cls.classifyInstance(instance);
				instance.setClassValue(result);
				
				String prediction=instance.classAttribute().value((int)result);
				System.out.println(prediction);
				
				return prediction;
		} catch (Exception e) {
			logger.fatal(e);
			e.printStackTrace();
		}
		return "successful";
	}
	
	public Instances getDataset() throws Exception {
		Instances instancesFromFile = new Instances(
                new BufferedReader(
                        new FileReader("/Project-Medification/DataBase/diabetes/bagging/pre.arff")));
		
		return instancesFromFile;		
	}
	
	public Instance getInstanceFromSignal(String signal, String separator) {
		String[] dataString = signal.split(separator);
		double data[] = new double[dataString.length];
		for(int i=0; i<dataString.length; i++) {
			try {
				data[i] = Double.parseDouble(dataString[i]);
			} catch (Exception e) {
				data[i] = Double.NaN;
			}
		}
		Instance instance = new DenseInstance(1.0, data);
		return instance;
	}
}