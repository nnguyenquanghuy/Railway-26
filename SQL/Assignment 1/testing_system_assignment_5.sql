-- câu 1
DROP VIEW IF EXISTS Ques_count_view;

CREATE VIEW Ques_count_view AS
SELECT COUNT(a.QuestionID) AS No_of_ques
FROM Answer a
GROUP BY a.QuestionID;

SELECT q.QuestionID, q.Content, COUNT(a.QuestionID)
FROM Question q
JOIN Answer a
ON q.QuestionID = a.QuestionID
GROUP BY a.QuestionID
HAVING COUNT(a.QuestionID) = (SELECT MAX(No_of_ques) FROM Ques_count_view);

-- câu 2
