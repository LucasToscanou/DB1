//Lista 6 SQL BD1

//1 -ERRO-
SELECT DISTINCT R.cgc, R.nome
FROM REVENDEDORAS R, AUTOMOVEIS A, GARAGENS G
WHERE A.pais <> 'Franca'
AND A.codigo = G.codigo
AND A.ano = G.ano
AND G.cgc = R.cgc 

//2 ????
SELECT DISTINCT C.nome, C.sobrenome
FROM NEGOCIOS N, CONSUMIDORES C
WHERE C.cpf NOT IN ()

//3 CERTO mas menos eficiente
SELECT A.fabricante, A.modelo, A.ano
FROM AUTOMOVEIS A, GARAGENS G
WHERE A.codigo = G.codigo
AND A.ano = G.ano
AND A.preco_tabela IN (
  SELECT MIN(A.preco_tabela) 
  FROM AUTOMOVEIS A, GARAGENS G
  WHERE A.codigo = G.codigo
  AND A.ano = G.ano 
)

//4 CERTO
SELECT E.nome
FROM EMPREGADO E
WHERE E.ident NOT IN(
  SELECT D.identemp
  FROM DEPENDENTE D
)

//5 CERTO
SELECT E.nome, E.endereco
FROM EMPREGADO E
WHERE E.endereco LIKE 'São%'

//6 CERTO
SELECT E.nome, E.sal*1.1 salario_ajustado
FROM EMPREGADO E
WHERE E.ident IN(
  SELECT TN.identemp
  FROM PROJETO P, TRABALHANO TN
  WHERE P.num = TN.projnum
  AND P.nome = 'Reengenharia'
)

//7 CERTO
SELECT E.nome
FROM EMPREGADO E
WHERE E.superident IS NULL

//8 CERTO
(SELECT DL.local FROM DEPLOC DL)
UNION 
(SELECT P.local FROM PROJETO P)


