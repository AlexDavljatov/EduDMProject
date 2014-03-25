package edu.dm.data.recommendations.mahout

import org.apache.mahout.cf.taste.impl.model.file.FileDataModel
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender
import org.apache.mahout.cf.taste.model.DataModel
import org.apache.mahout.cf.taste.recommender.Recommender
import org.springframework.transaction.annotation.Transactional

/**
 * SlopeOneService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class SlopeOneService {

    def doRecommend() {
//        DataModel model = new FileDataModel(new File("data.txt"));
        // Make a weighted slope one recommender
//        Recommender recommender = new SlopeOneRecommender(model) as Recommender;
//        Recommender cachingRecommender = new
//        CachingRecommender(recommender);

    }
}
