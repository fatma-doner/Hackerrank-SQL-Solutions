SELECT hackers.hacker_id, hackers.name, SUM(subquery1.max_score) AS total_score FROM hackers
JOIN
(
        SELECT hackers.hacker_id, MAX(submissions.score) AS max_score FROM hackers
        JOIN submissions ON hackers.hacker_id = submissions.hacker_id
        GROUP BY hackers.hacker_id, submissions.challenge_id
) subquery1
ON subquery1.hacker_id = hackers.hacker_id
GROUP BY hackers.hacker_id, hackers.name
HAVING SUM(subquery1.max_score) != 0
ORDER BY total_score DESC, hackers.hacker_id;