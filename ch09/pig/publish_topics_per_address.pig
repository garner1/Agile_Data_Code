/* MongoDB libraries and configuration */
REGISTER /me/Software/mongo-hadoop/mongo-2.10.1.jar
REGISTER /me/Software/mongo-hadoop/core/target/mongo-hadoop-core-1.1.0-SNAPSHOT.jar
REGISTER /me/Software/mongo-hadoop/pig/target/mongo-hadoop-pig-1.1.0-SNAPSHOT.jar

DEFINE MongoStorage com.mongodb.hadoop.pig.MongoStorage();

per_address_scores = LOAD '/tmp/topics_per_address.txt' AS (address:chararray, topics:bag{topic:tuple(word:chararray, score:double)});
store per_address_scores into 'mongodb://localhost/agile_data.topics_per_address' using MongoStorage();
