SELECT c.hacker_id, h.name, COUNT(c.challenge_id) AS challenges_created
FROM Challenges c
JOIN Hackers h ON c.hacker_id = h.hacker_id
GROUP BY c.hacker_id, h.name
HAVING COUNT(c.challenge_id) = (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(challenge_id) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        )
    )
    OR COUNT(c.challenge_id) IN (
        SELECT cnt
        FROM (
            SELECT COUNT(challenge_id) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        )
        GROUP BY cnt
        HAVING COUNT(*) < 2
    )
ORDER BY challenges_created DESC, c.hacker_id;

