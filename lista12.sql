//Lista 12


//1A

CREATE VIEW Voitures_Novas_Lucas AS (
    SELECT A.codigo, A.fabricante, A.modelo, A.ano, A.pais, A.preco_tabela
    FROM automoveis A
    WHERE A.pais = 'Franca'
    AND A.ano = '20'
    )
    
//1B

CREATE VIEW Zero_Francês AS (
    SELECT R.cgc, R.nome, R.proprietario, R.cidade, R.estado
    FROM revendedoras R, garagens G, Voitures_Novas_Lucas VN
    WHERE R.cgc = G.cgc
    AND G.codigo = VN.codigo
    AND G.ano = VN.ano
    )
    
//1C

CREATE VIEW  Auto_ok AS (
    SELECT A.codigo, A.fabricante, A.modelo, A.ano, A.pais, A.preco_tabela
    FROM automoveis A, (
        SELECT *
        FROM automoveis A2
        WHERE A2.ano != '20') T
    WHERE A.ano = '20'
    AND A.preco_tabela > T.preco_tabela
    AND A.codigo = T.codigo
    )

//1D

CREATE VIEW Neg_ok AS(
    SELECT comprador, revenda, codigo, ano, data, preço
    FROM negocios N
    WHERE
    
    revendedoras R
    SELECT DISTINCT A.codigo, A.ano
    FROM automoveis A
    WHERE R.
    )























    
