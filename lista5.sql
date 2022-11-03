//Lista 5 SQL BD1

//1
SELECT DISTINCT fabricante, pais
FROM automoveis

//2
SELECT DISTINCT estado
FROM automoveis, garagens, revendedoras
WHERE automoveis.modelo = 'Elba'
AND automoveis.fabricante = 'Fiat'
AND garagens.codigo = automoveis.codigo
AND garagens.cgc = revendedoras.cgc

//3 -CODIGO PADRAO XANDE-
SELECT cgc, proprietario, estado
FROM REVENDEDORAS R1
WHERE proprietario IN (
  SELECT proprietario
  FROM REVENDEDORAS R2
  WHERE R1.cgc <> R2.cgc
  AND R1.estado <> R2.estado
) 
ORDER BY proprietario, cgc

//4
SELECT rev.cgc, rev.nome, auto.ano, auto.pais
FROM automoveis auto, negocios neg, revendedoras rev
WHERE auto.ano = '95'
AND (auto.pais = 'EUA' OR auto.pais = 'Japao')
AND auto.codigo = neg.codigo
AND neg.preco <= (1.3 * auto.preco_tabela)
AND rev.cgc = neg.cgc
AND auto.ano = neg.ano
AND neg.preco > auto.preco_tabela



//5
SELECT proj.num, proj.depnum
FROM projeto proj

//6
SELECT dep.nome, dep.parentesco, dep.identemp, emp.nome
FROM dependente dep, empregado emp
WHERE dep.identemp = emp.ident

//7
SELECT emp0.nome, emp0.sexo, emp1.ident superident, emp1.nome supernome
FROM empregado emp0, empregado emp1
WHERE emp0.superident = emp1.ident

//8
SELECT DISTINCT sal
FROM empregado

//9
SELECT emp.nome
FROM trabalhano trn, empregado emp
WHERE trn.hrs < '20'
AND trn.identemp = emp.ident




















