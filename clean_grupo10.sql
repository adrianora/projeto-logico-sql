
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

	Descrição: Script de remoção de dados terceira fase.
**/


DELETE FROM m_pluviometrica WHERE EXISTS (SELECT * FROM m_pluviometrica WHERE id > 0);

DELETE FROM batimetria WHERE EXISTS (SELECT * FROM batimetria WHERE id > 0);

DELETE FROM m_cota_diaria WHERE EXISTS (SELECT * FROM m_cota_diaria WHERE id > 0);

DELETE FROM telefones_usuario WHERE EXISTS (SELECT * FROM telefones_usuario WHERE matricula > 0);

DELETE FROM usuario WHERE EXISTS (SELECT * FROM usuario WHERE matricula > 0);

DELETE FROM contribui WHERE EXISTS (SELECT * FROM contribui WHERE acude_id > 0 AND p_pluviometrico_id > 0);

DELETE FROM p_pluviometrico WHERE EXISTS (SELECT * FROM p_pluviometrico WHERE id > 0);

DELETE FROM cota_area_volume WHERE EXISTS (SELECT * FROM cota_area_volume WHERE id > 0);

DELETE FROM e_de_qualidade WHERE EXISTS (SELECT * FROM e_de_qualidade WHERE id > 0);

DELETE FROM m_qualidade_acd WHERE EXISTS (SELECT * FROM m_qualidade_acd WHERE id > 0);

DELETE FROM acude WHERE EXISTS (SELECT * FROM acude WHERE id > 0);

DELETE FROM rio WHERE EXISTS (SELECT * FROM rio WHERE id > 0);

DELETE FROM m_qualidade_rio WHERE EXISTS (SELECT * FROM m_qualidade_rio WHERE id > 0);

DELETE FROM bacia WHERE EXISTS (SELECT * FROM bacia WHERE id > 0);