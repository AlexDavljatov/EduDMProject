package edu.dm.weka.classification;

import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.trees.J48;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

import java.util.Random;


/**
 * Created with IntelliJ IDEA.
 * User: Alex
 * Date: 15.03.14
 * Time: 0:40
 * To change this template use File | Settings | File Templates.
 */
public class ClassificationTest {
    public static void main(String[] args) {
        try {
            classify();
            classifyCrossValidation();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }

    static void classify() throws Exception {
        Instances test = DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-test.arff");
        test.setClassIndex(test.numAttributes() - 1);
        Instances train = DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-training.arff");
        train.setClassIndex(train.numAttributes() - 1);

        Classifier cls = new J48();
//            Classifier cls = new NaiveBayes();
        cls.buildClassifier(train);
        Evaluation eval = new Evaluation(train);
        eval.evaluateModel(cls, train);
        System.out.println(eval.toSummaryString("\nResults\n\n", false));

    }

    static void classifyCrossValidation() throws Exception {
        Instances data = DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\bmw-browsers.arff");
        data.setClassIndex(data.numAttributes() - 1);
        Evaluation eval = new Evaluation(data);
        J48 tree = new J48();
        eval.crossValidateModel(tree, data, 10, new Random(1));
        System.out.println(eval.toSummaryString("\nResults\n\n", false));
    }
}
