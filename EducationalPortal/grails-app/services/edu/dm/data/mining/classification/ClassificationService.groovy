package edu.dm.data.mining.classification

import org.springframework.transaction.annotation.Transactional
import weka.classifiers.Classifier
import weka.classifiers.Evaluation
import weka.classifiers.trees.J48
import weka.core.Instances
import weka.core.converters.ConverterUtils

/**
 * ClassificationService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class ClassificationService {

    def classify(String trainPath, String testPath) {
        Instances test = ConverterUtils.DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-test.arff");
        test.setClassIndex(test.numAttributes() - 1);
        Instances train = ConverterUtils.DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-training.arff");
        train.setClassIndex(train.numAttributes() - 1);

        Classifier cls = new J48();
//            Classifier cls = new NaiveBayes();
        cls.buildClassifier(train);
        Evaluation eval = new Evaluation(train);
        eval.evaluateModel(cls, train);
        System.out.println(eval.toSummaryString("\nResults\n\n", false));
    }

    def classifyByCrossValidation(String path) {
        Instances test = ConverterUtils.DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-test.arff");
        test.setClassIndex(test.numAttributes() - 1);
        Instances train = ConverterUtils.DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-training.arff");
        train.setClassIndex(train.numAttributes() - 1);

        Classifier cls = new J48();
//            Classifier cls = new NaiveBayes();
        cls.buildClassifier(train);
        Evaluation eval = new Evaluation(train);
        eval.evaluateModel(cls, train);
        System.out.println(eval.toSummaryString("\nResults\n\n", false));
    }
}
