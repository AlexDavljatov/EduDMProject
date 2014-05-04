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

    def doLinearRegression(Instances data){
        data.setClassIndex(data.numAttributes() - 1)
        LinearRegression model = new LinearRegression()
        model.buildClassifier(data)
        return model
    }

    def doLinearRegression(Instances data, Instance entry){
        def model = doLinearRegression(data)
        double result = model.classifyInstance(entry)
        return result
    }
}
