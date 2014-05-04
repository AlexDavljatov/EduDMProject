package edu.dm.data.recommendations.mahout

import edu.dm.security.User
import org.apache.log4j.Logger
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender
import org.apache.mahout.cf.taste.impl.similarity.AveragingPreferenceInferrer
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity
import org.apache.mahout.cf.taste.model.DataModel
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood
import org.apache.mahout.cf.taste.recommender.RecommendedItem
import org.apache.mahout.cf.taste.recommender.Recommender
import org.apache.mahout.cf.taste.similarity.UserSimilarity
import org.springframework.transaction.annotation.Transactional

/**
 * RecommendationService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class RecommendationService {
    private static Logger log = Logger.getLogger(this)

    def doUserBasedRecommendations(DataModel model, int userId) {
        log.debug(model.getItemIDsFromUser(userId))
        UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
        similarity.setPreferenceInferrer(new AveragingPreferenceInferrer(model));

//        UserNeighborhood neighborhood =
//            new NearestNUserNeighborhood(10, similarity, model);
        UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, model);

        Recommender recommender =
            new GenericUserBasedRecommender(model, neighborhood, similarity);
//        Recommender cachingRecommender = new CachingRecommender(recommender);
        List<RecommendedItem> recommendations = recommender.recommend(userId, 10);
        log.debug('service recommendations: ' + recommendations)
        return recommendations
    }
}
