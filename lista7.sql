//Lista 7 de SQL BD1

//1
SELECT DISTINCT G.pessoa
FROM VENDA V INNER JOIN GOSTAM G ON V.cerveja = G.cerveja
WHERE V.bar = 'Padoca'

//2
SELECT DISTINCT G.pessoa
FROM VENDA V INNER JOIN GOSTAM G ON V.cerveja = G.cerveja
WHERE V.bar = 'Padoca' 
AND G.pessoa NOT IN(
  SELECT G.pessoa
  FROM VENDA V INNER JOIN GOSTAM G ON V.cerveja = G.cerveja
  WHERE V.cerveja NOT IN(
    SELECT V.cerveja
    FROM VENDA V
    WHERE V.bar = 'Padoca'
  )
)

//3
SELECT DISTINCT G.pessoa
FROM VENDA V INNER JOIN GOSTAM G ON V.cerveja = G.cerveja
WHERE V.cerveja IN(
  SELECT V.cerveja
  FROM VENDA V
  WHERE V.bar = 'Padoca'
  AND V.cerveja NOT IN(
    SELECT V.cerveja
    FROM VENDA V
    WHERE V.bar != 'Padoca'
  )
)
