/*Exercise 2.3 Content Lifecycle: What is the average time between the 
publishing of a post and the first engagement it receives? What is the 
average time between the publishing of a post and the last engagement it 
receives? Answer and explain your queries/calculations below. You may use 
SQL and/or Python to perform this task. (4 points)
*/

WITH 
first_comment AS (
    SELECT post_id, Min(created_at) AS first_time
    FROM comments
    GROUP BY post_id
),

last_comment AS (
    SELECT post_id, Max(created_at) AS last_time
    FROM comments
    GROUP BY post_id
)

SELECT
Avg(strftime('%s', first_comment.first_time) - 
    strftime('%s', posts.created_at)) / 3600 AS avg_hour_first_comment,
Avg(strftime('%s', last_comment.last_time) - 
    strftime('%s', posts.created_at)) / 3600  AS avg_hour_last_comment
FROM posts
JOIN first_comment ON posts.id = first_comment.post_id
JOIN last_comment ON posts.id = last_comment.post_id;

