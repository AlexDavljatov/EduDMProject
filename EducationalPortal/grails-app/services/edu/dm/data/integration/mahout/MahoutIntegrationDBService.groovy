package edu.dm.data.integration.mahout

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel
import org.apache.mahout.cf.taste.impl.model.mongodb.MongoDBDataModel
import org.apache.mahout.cf.taste.model.JDBCDataModel
import org.springframework.transaction.annotation.Transactional

import java.text.SimpleDateFormat

/**
 * MahoutIntegrationDBService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class MahoutIntegrationDBService {

    def getMongoDataModel(
            String host, int port, String database, String collection,
            String userIDField, String itemIDField, String preferencesField, String mapCollection) throws UnknownHostException {
        return new MongoDBDataModel(
                host, port,
                database, collection,
                false, false,
                new SimpleDateFormat("yyyy.MM.dd G 'at' HH:mm:ss z"),
                "mydb_root", "mydb_matmex",
                userIDField, itemIDField, preferencesField, mapCollection);
    }

    def getMongoDataModel(
            String collection, String userIDField, String itemIDField, String preferencesField) throws UnknownHostException {
        return new MongoDBDataModel(
                "localhost", 27017,
                'mydb', collection,
                false, false,
                new SimpleDateFormat("yyyy.MM.dd G 'at' HH:mm:ss z"),
                "mydb_root", "mydb_matmex",
                userIDField, itemIDField, preferencesField, 'mapCol');
    }


    def getMySqlDataModel() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName("localhost");
        dataSource.setUser("root");
        dataSource.setPassword("matmex");
        dataSource.setDatabaseName("mydb");
        return new MySQLJDBCDataModel(dataSource, "testdm", "user_id", "item_id", "score", null);
    }

    def getMySqlDataModel(String collection, String userIDField, String itemIDField, String preferencesField) {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName("localhost");
        dataSource.setUser("root");
        dataSource.setPassword("matmex");
        dataSource.setDatabaseName("mydb");
        return new MySQLJDBCDataModel(dataSource, collection, userIDField, itemIDField, preferencesField, null);
    }

}
