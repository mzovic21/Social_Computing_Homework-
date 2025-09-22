/*Exercise 1.4 Spammers: Identify users who have shared the same text in 
posts or comments at least 3 times over and over again (in all their 
history, not just the last 3 contributions). Answer and explain your 
queries/calculations below. You may use SQL and/or Python to perform 
this task. (5 points)
*/

SELECT users.username, Count(*) AS repeat_number, posts.content
FROM posts
JOIN users ON posts.user_id = users.id
GROUP BY users.username
HAVING repeat_number >= 3
UNION ALL
SELECT users.username, Count(*) AS repeat_number, comments.content
FROM comments
JOIN users ON comments.user_id = users.id
GROUP BY users.username
HAVING repeat_number >= 3
ORDER BY repeat_number DESC;