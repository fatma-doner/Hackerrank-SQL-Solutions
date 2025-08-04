SELECT 
    s.hacker_id,
    h.name
FROM 
    Submissions s
LEFT JOIN 
    Challenges c ON s.challenge_id = c.challenge_id
LEFT JOIN 
    Difficulty d ON c.difficulty_level = d.difficulty_level
LEFT JOIN 
    Hackers h ON s.hacker_id = h.hacker_id
WHERE 
    s.score = d.score
GROUP BY 
    s.hacker_id, h.name
HAVING 
    COUNT(s.challenge_id) > 1
ORDER BY 
    COUNT(s.challenge_id) DESC,
    s.hacker_id;
