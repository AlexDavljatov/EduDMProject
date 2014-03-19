package edu.dm.weka.regression;

import weka.classifiers.functions.LinearRegression;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils;

/**
 * Created with IntelliJ IDEA.
 * User: Alex
 * Date: 15.03.14
 * Time: 20:32
 * To change this template use File | Settings | File Templates.
 */
public class RegressionTest {
    public static void main(String[] args) {
        try {
            Instances data = ConverterUtils.DataSource.read("C:\\Users\\Alex\\Google Диск\\Diploma\\weka\\svn\\WekaMvn\\src\\main\\resources\\houses.arff");
            data.setClassIndex(data.numAttributes() - 1);
            LinearRegression model = new LinearRegression();
            model.buildClassifier(data);
            System.out.println(model);
            Instance myHouse = data.lastInstance();
            double price = model.classifyInstance(myHouse);
            System.out.println(price);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

    }
}
