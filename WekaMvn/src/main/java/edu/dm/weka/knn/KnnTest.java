package edu.dm.weka.knn;

import weka.classifiers.Classifier;
import weka.classifiers.lazy.IBk;
import weka.clusterers.ClusterEvaluation;
import weka.clusterers.EM;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.CSVLoader;
import weka.core.converters.ConverterUtils.DataSource;
import weka.filters.Filter;
import weka.filters.unsupervised.attribute.Remove;

import java.io.File;

/**
 * Created by Alex on 10.03.14.
 */
public class KnnTest {
    public static void main(String[] args) {
        try {
//            Instances data = DataSource.read("C:\\Users\\Alex\\Desktop\\coursera\\Big Data in Education\\w1\\bigdata-edu_Data-Sets_CogSci-Godwinetal-2013-4.csv");
            CSVLoader loader = new CSVLoader();
            loader.setSource(new File("C:\\Users\\Alex\\Desktop\\coursera\\Big Data in Education\\w1\\bigdata-edu_Data-Sets_SaoPedroetal_2013_UMUAI_DesigningControlledExperiments_cummandlocalfeatures.csv"));
            Instances data = loader.getDataSet();
            System.out.println(data.numAttributes());
            data.setClassIndex(data.numAttributes() - 1);

            // generate data for clusterer (w/o class)
            Remove filter = new Remove();
            filter.setAttributeIndices("" + (data.classIndex() + 1));
            filter.setInputFormat(data);
            Instances dataClusterer = Filter.useFilter(data, filter);

            // train clusterer
            EM clusterer = new EM();
            // set further options for EM, if necessary...
            clusterer.buildClusterer(dataClusterer);

            // evaluate clusterer
            ClusterEvaluation eval = new ClusterEvaluation();
            eval.setClusterer(clusterer);
            eval.evaluateClusterer(data);

            // print results
            System.out.println(eval.clusterResultsToString());
            System.out.println();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
