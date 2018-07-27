/**
    - Projeto Lógico, Banco de Dados 1, 09/03/2018
    - Professor: Cláudio Baptista
    - Monitoria: Brunna Amorim
    - Identificador do Grupo: 10
    - Equipe:   Adriano Ribeiro,
                Agnaldo Junior,
                Dayvson Weslley,
                Rubens Batista,
                Matheus Melo,
                Wesley Anibal

	Descrição: Script de consulta, terceira fase.
**/

/* 1. Crie uma visão que liste os valores de chuva diários do mês atual, agrupados por usuário. */

CREATE VIEW lista_chuva_mes AS
SELECT b.valor_chuva AS "Valores Chuva", u.nome AS "Nome", b.data AS "Data"
FROM m_pluviometrica m, batimetria b, usuario u
WHERE ((m.batimetria_id = b.id) AND (m.usuario_matricula = u.matricula) AND
      (to_char(sysdate, 'MM/YYYY') = to_char(data, 'MM/YYYY'))) ORDER BY (u.nome);

/* 2. Liste os valores de turbidez medidos para o açude de Bodocongó entre os dias 02/12/2017 e 02/01/2018. */

SELECT turbidez
FROM m_qualidade_acd M
WHERE (data BETWEEN '12/02/2017' AND '01/02/2018') AND acude_id in
(SELECT id FROM acude WHERE (nome = 'Bodocongó'));

/* 3. Faça um trigger que, ao tentar inserir uma medição de qualidade de rio com uma data posterior ao dia atual, seja feita a inserção usando a data atual. */

CREATE OR REPLACE TRIGGER VerificaDataMedicao
BEFORE INSERT OR UPDATE ON M_QUALIDADE_RIO
FOR EACH ROW
    BEGIN
        IF(:new.data > SYSDATE) THEN
            :new.data := SYSDATE;
        END IF;
END VerificaDataMedicao;

/* Ativado com o insert: */

INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (15, '10/10/2018', 4, 5, 0.5, 6, 8.0);

/* 4. Crie uma visão que liste o nome dos açudes e seus os valores de alcalinidade para todos os açudes da Paraíba. */

CREATE VIEW lista_acudes_pb AS
SELECT a.nome, m.alcalinidade
FROM acude a, m_qualidade_acd m, p_pluviometrico p, contribui c
WHERE (a.id = m.acude_id) AND (p.endereco = 'Paraiba') AND 
(c.acude_id = a.id) AND (c.p_pluviometrico_id = p.id);

/* 5. Qual o pH médio medido nos meses de novembro e dezembro pro rio Amazonas? */

SELECT AVG(ph) AS "PH Médio Rio Amazonas"
FROM m_qualidade_rio 
WHERE id IN (SELECT m_qualidade_rio_id FROM rio WHERE nome = 'Rio Amazonas') 
AND to_char(data,'MM') BETWEEN '11' AND '12';

/* 6. Liste os valores das cotas diárias registradas pelo usuário José, ordenadas de forma decrescente. */

SELECT m.cota_atual AS "Cota Atual"
FROM m_cota_diaria m, usuario u
WHERE (u.matricula = m.usuario_matricula) AND u.nome = 'José'
ORDER BY m.cota_atual DESC;

/* 7. Liste o nome dos 3 usuários que cadastraram o menor número de medições pluviométricas. */

SELECT nome
FROM (SELECT COUNT(*), u.nome
FROM usuario u, m_pluviometrica m
WHERE (u.matricula = m.usuario_matricula)
GROUP BY u.nome ORDER BY COUNT(*))
WHERE ROWNUM <= 3;

/* 8. Qual o açude com a maior área?  */

SELECT nome FROM acude WHERE (area in (SELECT max(area) FROM ACUDE));

/*9. Liste os nomes das estações de qualidade e o nome do açude em que é feita a medição, agrupado por nome do açude.*/

SELECT e.nome AS "Nome Estacao", a.nome AS "Nome Acude"
FROM e_de_qualidade e, acude a, m_qualidade_acd m
WHERE ((a.id = m.acude_id) AND (e.m_qualidade_acd_id = m.id))
ORDER BY a.nome;

/* 10. Faça um trigger que não permita a atualização do endereço de um posto pluviométrico. */

CREATE OR REPLACE TRIGGER MantemEndereco
BEFORE UPDATE ON  P_PLUVIOMETRICO
FOR EACH ROW 
  BEGIN
      IF (:old.endereco is not NULL) THEN
          :new.endereco := :old.endereco;
      END IF;
END MantemEndereco;

/* Ativado com o update: */

UPDATE p_pluviometrico
SET endereco = 'Paraiba'
WHERE endereco = 'Rio Grande Norte'

/* 11. Liste os valores de oxigênio e o nome da bacia, agrupadas pelo nome da bacia. */

SELECT sum(m.oxigenio) as "Oxigenio", b.nome as "Nome Bacia"
FROM Bacia b, M_QUALIDADE_RIO m, Rio r
WHERE b.id = r.Bacia_id AND r.M_QUALIDADE_RIO_id = m.id
GROUP BY b.nome

/* 12. Liste o nome dos postos pluviométricos localizados no Rio Grande Norte ou em Pernambuco. */

SELECT nome
FROM p_pluviometrico
WHERE endereco = 'Rio Grande Norte' OR endereco = 'Pernambuco';

/* 13. Qual a soma das cotas diárias do açude de bodocongó nos meses de Novembro/2017 e Dezembro/2017? */

SELECT SUM(m.cota_atual) AS "Soma Media Cota Atual"
FROM m_cota_diaria m, acude a
WHERE (m.acude_id = a.id) AND (a.nome = 'Bodocongó') AND (to_char(m.data,'MM/YYYY') BETWEEN '11/2017' AND '12/2017');

/* 14. Liste o nome dos açudes, sua área, volume máximo e comprimento, ordenados pela área de forma crescente. */

SELECT a.nome, a.area, a.volume_maximo, a.comprimento
FROM ACUDE a
ORDER BY a.area;

/* 15. Liste a quantidade de medições pluviométricas feitas por usuário. */

SELECT COUNT(*) AS "Num Medicoes", u.matricula AS "Mat User"
FROM m_pluviometrica m, usuario u
WHERE (u.matricula = m.usuario_matricula)
GROUP BY (u.matricula);