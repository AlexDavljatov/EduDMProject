package edu.dm.data.mining.regression

import org.springframework.transaction.annotation.Transactional
import weka.classifiers.functions.LinearRegression
import weka.core.Instance
import weka.core.Instances
import weka.core.converters.ConverterUtils

/**
 * RegressionService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class RegressionService {

    def doRegression() {
        Instances data = ConverterUtils.DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\houses.arff");
        data.setClassIndex(data.numAttributes() - 1);
        LinearRegression model = new LinearRegression();
        model.buildClassifier(data);
        System.out.println(model);
        Instance myHouse = data.lastInstance();
        double price = model.classifyInstance(myHouse);
        System.out.println(price);
    }
}
