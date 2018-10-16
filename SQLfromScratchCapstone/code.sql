-- Quiz Funnel  - Task 1

SELECT *
FROM survey
LIMIT 10;

-- Quiz Funnel - Task 2

SELECT question,
	COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;

-- Home Try-On Funnel - Task 4

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

-- Home Try-On Funnel - Task 5

SELECT DISTINCT quiz.user_id,
	CASE home_try_on.user_id IS NOT NULL
  	WHEN 1 THEN 'True'
    ELSE 'False' 
    END AS 'is_home_try_on',
  CASE home_try_on.number_of_pairs
  	WHEN '3 pairs' THEN 3
    WHEN '5 pairs' THEN 5
    ELSE 'Null' 
    END AS 'number_of_pairs',
  CASE purchase.user_id IS NOT NULL 
   	WHEN 1 THEN 'True'
   	ELSE 'False' 
    END AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
	ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
	ON purchase.user_id = quiz.user_id
LIMIT 10;

-- REMOVED LIMIT 10; ABOVE FOR FULL ANALYSIS

-- Analyze - Task 6

SELECT MAX(price)
FROM purchase;

SELECT MIN(price)
FROM purchase;

SELECT ROUND(AVG(price), 2) AS 'avg_price'
FROM purchase;

SELECT style,
	COUNT(style)
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;

SELECT model_name, 
	COUNT(model_name)
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;

SELECT color,
	COUNT(color)
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;

SELECT fit,
	COUNT(fit)
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;

SELECT shape,
	COUNT(shape)
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;

SELECT color,
	COUNT(color)
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;