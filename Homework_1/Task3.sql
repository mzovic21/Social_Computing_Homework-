/*Exercise 1.3 Influencers: In the history of the platform, who are the 
5 users with the most engagement on their posts? Describe how you measure
engagement. Answer and explain your queries/calculations below. You may 
use SQL and/or Python to perform this task. (4 points)
*/

SELECT users.username,
Sum((SELECT Count(*) FROM comments WHERE comments.post_id = posts.id)) 
AS number_of_comments,
Sum((SELECT Count(*) FROM reactions WHERE reactions.post_id = posts.id)) 
AS number_of_reactions,
Sum((SELECT Count(*) FROM comments WHERE comments.post_id = posts.id)) +
Sum((SELECT Count(*) FROM reactions WHERE reactions.post_id = posts.id)) 
AS engagement
FROM users
JOIN posts ON users.id = posts.user_id
GROUP BY users.username
ORDER BY engagement DESC LIMIT 5;