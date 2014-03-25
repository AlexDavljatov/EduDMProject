package edu.dm.data.mining.clusterization

import org.springframework.transaction.annotation.Transactional
import weka.clusterers.ClusterEvaluation
import weka.clusterers.EM
import weka.core.Instances
import weka.core.converters.ConverterUtils

/**
 * ClusterizationService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class ClusterizationService {

    def doClusterize() {
        Instances data = ConverterUtils.DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-browsers.arff");
        EM cl = new EM();
        cl.setNumClusters(5);
        cl.buildClusterer(data);
        ClusterEvaluation eval = new ClusterEvaluation();
        eval.setClusterer(cl);
        eval.evaluateClusterer(new Instances(data));
        System.out.println(eval.clusterResultsToString());
    }
}
