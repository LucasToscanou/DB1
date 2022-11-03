//Lista 11


//1

SELECT distinct C.cpf, C.nome, C.sobrenome, temp.cnt, temp.sum_preco
FROM  consumidores C, (
  SELECT N.cpf, count(N.codigo) as cnt, sum(N.preco) as sum_preco
  FROM negocios N
  GROUP BY N.cpf
) temp
WHERE C.cpf = temp.cpf
AND temp.cnt >= 2


//2 ERRO

SELECT DISTINCT R.cgc, R.nome, T.qtd
FROM revendedoras R, (
    SELECT G.cgc, count(A.codigo) qtd
    FROM garagens G, automoveis A
    WHERE G.codigo = A.codigo
    AND G.ano = A.ano 
    GROUP BY G.cgc
    HAVING count(A.codigo) <= 3 
    ) T
WHERE R.cgc = T.cgc

//3
SELECT P.num, P.nome, Temp.nrEmp
FROM projeto P, (
    SELECT T.projnum projnum, count(T.identemp) nrEmp
    FROM trabalhano T
    GROUP BY T.projnum
    HAVING count(T.identemp) > 2
    ) Temp
WHERE P.num = Temp.projnum 


//4

SELECT DISTINCT D.num, D.nome, T2.sal2000
FROM departamento D, (
    SELECT E1.depnum depnum, count(E1.ident) qtdEmp
    FROM empregado E1
    GROUP BY E1.depnum
    HAVING count(E1.ident) > 2
    ) T1,
    (
    SELECT E2.depnum depnum, count(E2.sal) sal2000
    FROM empregado E2
    WHERE E2.sal > 2000
    GROUP BY E2.depnum
    ) T2
WHERE T1.depnum = T2.depnum
AND D.num = T1.depnum

















