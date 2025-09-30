/*Exercise 2.2 Virality: Identify the 3 most viral posts in the history 
of the platform. Select and justify a specific metric or requirements for
a post to be considered viral. Answer and explain your queries/
calculations below. You may use SQL and/or Python to perform this task.
*/

SELECT Count(DISTINCT reactions.id) + Count(DISTINCT comments.id) 
AS total_points, users.username, posts.content
FROM posts
JOIN users ON posts.user_id = users.id
LEFT JOIN reactions ON posts.id = reactions.post_id
LEFT JOIN comments ON posts.id = comments.post_id
GROUP BY users.username, posts.content
ORDER BY total_points DESC LIMIT 3;
    