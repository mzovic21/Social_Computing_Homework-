/*Exercise 2.4 Connections: Identify the top 3 user pairs who engage with 
each other’s content the most. Define and describe your metric for 
engagement. Answer and explain your queries/calculations below. You may 
use SQL and/or Python to perform this task. (4 points)
*/

SELECT user1.username AS user_A, user2.username AS user_B,
Count(*) AS engagement_AB
FROM comments
JOIN posts ON comments.post_id = posts.id
JOIN users user1 ON comments.user_id = user1.id   
JOIN users user2 ON posts.user_id = user2.id    
WHERE comments.user_id != posts.user_id
GROUP BY user_A, user_B
ORDER BY engagement_AB DESC LIMIT 3;
