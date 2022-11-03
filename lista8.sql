//Lista 8 SQL BD1

//1 -ERRO-

//-nome e numero do departamento dos gerentes
SELECT E.nome, D.num
FROM EMPREGADO E, DEPARTAMENTO D
WHERE E.ident = D.identger

//-nome do gerente, numero do departamento que sao gerentes 
//e nome dos empregados desse departamento (incluindo o proprio gerente)
SELECT E1.nome nome_gerente, D.num num_depto, E2.nome nome_empregado 
FROM EMPREGADO E1, EMPREGADO E2, DEPARTAMENTO D
WHERE E1.ident = D.identger
AND E2.depnum = D.num

ORDER BY E1.nome, D.num


//-RESPONDENDO CERTO
SELECT E1.nome, E2.depnum
FROM (SELECT E.nome FROM EMPREGADO E) E1 FULL JOIN (SELECT E.nome, E.depnum FROM EMPREGADO E) E2 ON E1.nome = E2.nome
WHERE E1.nome NOT IN(
  SELECT nome
  FROM (SELECT D.identger FROM DEPARTAMENTO D) D INNER JOIN EMPREGADO E ON D.identger = E.ident
)
AND E2.nome IN(
  SELECT nome
  FROM (SELECT D.identger FROM DEPARTAMENTO D) D INNER JOIN EMPREGADO E ON D.identger = E.ident

)

//2
SELECT E.nome, E.depnum, E.sal
FROM EMPREGADO E
WHERE E.sal > (
  SELECT MAX(E.sal)
  FROM EMPREGADO E, DEPARTAMENTO D
  WHERE D.nome = 'Pesquisa' 
  AND E.depnum = D.num
)

//3 -ERRO-
//Solucao sem join
SELECT DISTINCT E1.nome, TN1.hrs, TN1.projnum
FROM EMPREGADO E1, TRABALHANO TN1, EMPREGADO E2, TRABALHANO TN2
WHERE E1.ident = TN1.identemp
AND E2.ident = TN2.identemp
AND E1.ident != E2.ident
AND TN1.projnum IN (
  SELECT TN.projnum
  FROM EMPREGADO E, TRABALHANO TN
  WHERE E.nome = 'Caetano Veloso'
  AND E.ident = TN.identemp
)
AND TN2.projnum IN (
  SELECT TN.projnum
  FROM EMPREGADO E, TRABALHANO TN
  WHERE E.nome = 'Caetano Veloso'
  AND E.ident = TN.identemp
)
AND TN1.projnum = TN2.projnum
AND TN1.hrs = TN2.hrs

ORDER BY TN1.projnum

//Solucao com join
SELECT DISTINCT T1.nome, T1.hrs, T1.projnum
FROM (
  SELECT E1.nome, TN1.projnum, TN1.hrs
  FROM EMPREGADO E1, TRABALHANO TN1
  WHERE E1.ident = TN1.identemp
  AND TN1.projnum IN (
    SELECT TN.projnum
    FROM EMPREGADO E, TRABALHANO TN
    WHERE E.nome = 'Caetano Veloso'
    AND E.ident = TN.identemp
  )
) T1
INNER JOIN
(
  SELECT E2.nome, TN2.projnum, TN2.hrs
  FROM EMPREGADO E2, TRABALHANO TN2
  WHERE E2.ident = TN2.identemp
  AND TN2.projnum IN (
    SELECT TN.projnum
    FROM EMPREGADO E, TRABALHANO TN
    WHERE E.nome = 'Caetano Veloso'
    AND E.ident = TN.identemp
  )
) T2
ON
T1.nome != T2.nome AND T1.projnum = T2.projnum AND T1.hrs = T2.hrs

ORDER BY T1.projnum


//4

(
    SELECT E.nome, E.sal
    FROM EMPREGADO E
    WHERE E.sal = (
        SELECT MAX(E.sal)
        FROM EMPREGADO E
    )
)

UNION 
(
    SELECT E.nome, E.sal
    FROM EMPREGADO E
    WHERE E.sal = (
        SELECT MAX(E.sal)
        FROM EMPREGADO E
        WHERE E.ident NOT IN (
            SELECT E.ident
            FROM EMPREGADO E
            WHERE E.sal = (
                SELECT MAX(E.sal)
                FROM EMPREGADO E
            )
        )
    )
)

UNION
(
    SELECT E.nome, E.sal
    FROM EMPREGADO E
    WHERE E.sal = (
        SELECT MAX(E.sal)
        FROM EMPREGADO E
        WHERE E.ident NOT IN (
            (SELECT E.ident
            FROM EMPREGADO E
            WHERE E.sal = (
                SELECT MAX(E.sal)
                FROM EMPREGADO E
                WHERE E.ident NOT IN (
                    SELECT E.ident
                    FROM EMPREGADO E
                    WHERE E.sal = (
                        SELECT MAX(E.sal)
                        FROM EMPREGADO E
                    )
                )
            ))
            UNION
            (SELECT E.ident
            FROM EMPREGADO E
            WHERE E.sal = (
                SELECT MAX(E.sal)
                FROM EMPREGADO E
            ))
        )
    )
)

ORDER BY sal


