package edu.dm.data.recommendations.mahout

import edu.dm.security.User
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender
import org.apache.mahout.cf.taste.impl.similarity.GenericItemSimilarity
import org.apache.mahout.cf.taste.model.DataModel
import org.apache.mahout.cf.taste.recommender.RecommendedItem
import org.apache.mahout.cf.taste.recommender.Recommender
import org.apache.mahout.cf.taste.similarity.ItemSimilarity
import org.springframework.transaction.annotation.Transactional

/**
 * ItemBasedService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class ItemBasedService {

    def mahoutIntegrationDBService

    def doRecommend(String dataPath) {
        DataModel model = new FileDataModel(new File("data.txt"));
        // Construct the list of pre-computed correlations
        Collection<GenericItemSimilarity.ItemItemSimilarity> correlations = null;
        ItemSimilarity itemSimilarity =
            new GenericItemSimilarity(correlations);
        Recommender recommender =
            new GenericItemBasedRecommender(model, itemSimilarity);
        Recommender cachingRecommender = new CachingRecommender(recommender);
//        ...
        List<RecommendedItem> recommendations =
            cachingRecommender.recommend(1234, 10);
    }

    def doRecommendations(User user){
//        DataModel model =
    }
}
