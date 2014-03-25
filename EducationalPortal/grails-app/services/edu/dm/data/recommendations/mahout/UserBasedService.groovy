package edu.dm.data.recommendations.mahout

import org.apache.mahout.cf.taste.impl.model.file.FileDataModel
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender
import org.apache.mahout.cf.taste.impl.similarity.AveragingPreferenceInferrer
import org.apache.mahout.cf.taste.model.DataModel
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood
import org.apache.mahout.cf.taste.recommender.RecommendedItem
import org.apache.mahout.cf.taste.recommender.Recommender
import org.apache.mahout.cf.taste.similarity.UserSimilarity
import org.apache.mahout.math.hadoop.similarity.cooccurrence.measures.PearsonCorrelationSimilarity
import org.springframework.transaction.annotation.Transactional

/**
 * UserBasedService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class UserBasedService {

    def doRecommend(String dataPath) {
        DataModel model = new FileDataModel(new File("data.txt"));
        UserSimilarity userSimilarity = new PearsonCorrelationSimilarity(model);
        // Optional:
        userSimilarity.setPreferenceInferrer(new AveragingPreferenceInferrer());

//        UserNeighberhood + nearest-3
        UserNeighborhood neighborhood =
            new NearestNUserNeighborhood(3, userSimilarity, model);

        Recommender recommender =
            new GenericUserBasedRecommender(model, neighborhood, userSimilarity);
        Recommender cachingRecommender = new CachingRecommender(recommender);

        List<RecommendedItem> recommendations =
            cachingRecommender.recommend(1234, 10);
    }
}
