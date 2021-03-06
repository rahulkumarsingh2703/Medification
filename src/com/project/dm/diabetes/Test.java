package com.project.dm.diabetes;

import java.io.File;

import weka.core.Instances;
import weka.core.converters.ArffSaver;
import weka.core.converters.ConverterUtils.DataSource;
import weka.filters.Filter;
import weka.filters.unsupervised.attribute.Remove;
import weka.filters.unsupervised.attribute.ReplaceMissingValues;

public class Test {
	public static void main(String args[]) throws Exception{
		
			DataSource source = new DataSource("/Project-Medification/DataBase/diabetes/bagging/diabetestest.arff");
			Instances dataset = source.getDataSet();		
			ReplaceMissingValues  miss = new ReplaceMissingValues();
			miss.setInputFormat(dataset);
			Instances newData = Filter.useFilter(dataset, miss);
			ArffSaver saver = new ArffSaver();
			saver.setInstances(newData);
			saver.setFile(new File("/Project-Medification/DataBase/diabetes/bagging/testmissdiabetes.arff"));
			saver.writeBatch();
			
			
			DataSource source1 = new DataSource("/Project-Medification/DataBase/diabetes/bagging/testmissdiabetes.arff");
			Instances dataset1 = source1.getDataSet();
			String[] opts = new String[]{ "-R", "1,4"};
			Remove remove = new Remove();
			remove.setOptions(opts);
			remove.setInputFormat(dataset1);
			Instances newData1 = Filter.useFilter(dataset1, remove);
			ArffSaver saver1 = new ArffSaver();
			saver1.setInstances(newData1);
			saver1.setFile(new File("/Project-Medification/DataBase/diabetes/bagging/testafilterdiabetes.arff"));
			saver1.writeBatch();
			
			
		
		
	}

}
