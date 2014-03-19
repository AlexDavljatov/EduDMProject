package edu.dm.weka.clusterization;

import weka.clusterers.ClusterEvaluation;
import weka.clusterers.EM;
import weka.core.Instances;
import weka.core.converters.ConverterUtils;

/**
 * Created with IntelliJ IDEA.
 * User: Alex
 * Date: 15.03.14
 * Time: 1:07
 * To change this template use File | Settings | File Templates.
 */
public class ClusterizationTest {
    public static void main(String[] args) {
        try {
            Instances data = ConverterUtils.DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-browsers.arff");
            EM cl = new EM();
            cl.setNumClusters(5);
            cl.buildClusterer(data);
            ClusterEvaluation eval = new ClusterEvaluation();
            eval.setClusterer(cl);
            eval.evaluateClusterer(new Instances(data));
            System.out.println(eval.clusterResultsToString());


        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }


    }
}
