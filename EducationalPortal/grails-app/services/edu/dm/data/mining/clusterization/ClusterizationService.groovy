package edu.dm.data.mining.clusterization

import org.apache.log4j.Logger
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
    private static Logger log = Logger.getLogger(this)

    def doCluster(Instances data, int clustersCount) {
        EM cl = new EM();
        cl.setNumClusters(clustersCount);
        cl.buildClusterer(data);
        ClusterEvaluation eval = new ClusterEvaluation();
        eval.setClusterer(cl);
        eval.evaluateClusterer(new Instances(data));
        return eval
    }
}
