/*Exercise 1.2 Lurkers: How many users are there on the platform who have 
not interacted with posts or posted any content yet (but may have followed 
other users)? Answer and explain your queries/calculations below. You may 
use SQL and/or Python to perform this task. (3 points)
*/

SELECT Count(users.id) AS number_of_users
FROM users
LEFT JOIN posts ON users.id = posts.user_id
LEFT JOIN comments ON users.id = comments.user_id
LEFT JOIN reactions ON users.id = reactions.user_id
WHERE posts.user_id IS NULL
AND comments.user_id IS NULL
AND reactions.user_id IS NULL;