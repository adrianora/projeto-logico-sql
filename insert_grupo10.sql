
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

	Descrição: Script de inserção de novos dados no DML da terceira fase.
**/


/* INSERTS BACIAS */

	INSERT INTO BACIA (id, nome, area, perimetro) VALUES (1, 'Atlântico Nordeste Oriental', 287000, 2180);
	INSERT INTO BACIA (id, nome, area, perimetro) VALUES (2, 'Atlântico Leste', 251000, 2991);
	INSERT INTO BACIA (id, nome, area, perimetro) VALUES (3, 'Atlântico Sudoeste', 123000, 3200);
	INSERT INTO BACIA (id, nome, area, perimetro) VALUES (4, 'Amazonas', 7000000, 68000);
	INSERT INTO BACIA (id, nome, area, perimetro) VALUES (5, 'Uruguai', 385000, 1258);

/* INSERTS M_QUALIDADE_RIO */

	/* APENAS RIO AMAZONAS */
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (1, '01/11/2017', 4, 10.5, 2, 2, 2);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (2, '12/11/2017', 12, 2.5, 7, 1, 1.2);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (3, '01/12/2017', 10, 4.7, 5, 2, 1.5);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (4, '12/01/2018', 6, 8.4, 6, 1, 2.5);

	/* MEDICOES AMAZONAS */
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (5, '05/11/2017', 4, 10.5, 2, 2, 2);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (6, '12/11/2017', 12, 2.5, 7, 1, 1.2);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (7, '01/12/2017', 10, 4.7, 5, 2, 1.5);

	/* MEDICOES NORDESTE */
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (8, '11/12/2017', 4, 8, 5.1, 6, 4.8);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (9, '11/12/2017', 4, 7, 6.7, 6, 4.0);

	/* MEDICOES SUDOESTE */
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (10, '06/03/2017', 4, 10, 12.0, 6, 5.7);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (11, '07/01/2018', 4, 7, 1.2, 6, 4.3);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (12, '07/01/2018', 4, 8, 1.3, 6, 7.7);
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (13, '07/08/2017', 4, 2, 2.7, 6, 6.5);

	/* MEDICOES URUGUAI */
	INSERT INTO M_QUALIDADE_RIO (id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (14, '05/02/2018', 4, 5, 0.5, 6, 8.0);

/* INSERTS RIO */

	/* RIO BACIA AMAZONAS */
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (1, 1, 4, 'Rio Amazonas', 'alto');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (12, 2, 4, 'Rio Amazonas', 'alto');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (13, 3, 4, 'Rio Amazonas', 'alto');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (14, 4, 4, 'Rio Amazonas', 'alto');

	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (2, 5, 4, 'Rio Japurá', 'alto');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (3, 6, 4, 'Rio Jutaí', 'alto');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (4, 7, 4, 'Rio Negro', 'alto');
	
	/* RIO BACIAS NORDESTE */
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (5, 8, 1, 'Rio Parnaíba', 'baixo');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (6, 9, 1, 'Rio Monteiro', 'normal');
	
	/* RIO BACIAS SUDOESTE */
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (7, 10, 3, 'Rio Paraíba do Sul', 'normal');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (8, 11, 3, 'Rio Doce', 'baixo');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (9, 12, 3, 'Rio Santa Maria', 'baixo');
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (10, 13, 3, 'Rio Reis Magos', 'alto');
	
	/* RIO BACIA URUGUAI*/
	INSERT INTO RIO (id, m_qualidade_rio_id, bacia_id, nome, indicativo) VALUES (11, 14, 5, 'Rio Uruguai', 'alto');

/* INSERTS ACUDE */

	INSERT INTO ACUDE (id, rio_m_qualidade_rio_id, rio_id, nome, volume_maximo, comprimento, area) VALUES (1, 1, 1, 'Bodocongó', 201087, 12, 251);
	INSERT INTO ACUDE (id, rio_m_qualidade_rio_id, rio_id, nome, volume_maximo, comprimento, area) VALUES (2, 9, 6, 'Epitácio Pessoa', 511000, 5.8, 261);
	INSERT INTO ACUDE (id, rio_m_qualidade_rio_id, rio_id, nome, volume_maximo, comprimento, area) VALUES (3, 10, 7, 'Acauã', 128000, 2.8, 57.6);
	INSERT INTO ACUDE (id, rio_m_qualidade_rio_id, rio_id, nome, volume_maximo, comprimento, area) VALUES (4, 8, 5, 'Sumé', 87000, 2.1, 37.5);
	INSERT INTO ACUDE (id, rio_m_qualidade_rio_id, rio_id, nome, volume_maximo, comprimento, area) VALUES (5, 1, 1, 'Marés', 15000, 1.2, 17.7);

/* INSERTS M_QUALIDADE_ACD */

	/* APENAS ACUDE BODOCONGO */
	INSERT INTO M_QUALIDADE_ACD (id, acude_id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (1, 1, '01/12/2017', 4, 10.5, 2, 2, 2);
	INSERT INTO M_QUALIDADE_ACD (id, acude_id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (2, 1, '03/12/2017', 12, 2.5, 7, 1, 1.2);
	INSERT INTO M_QUALIDADE_ACD (id, acude_id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (3, 1, '01/01/2018', 10, 4.7, 5, 2, 1.5);
	INSERT INTO M_QUALIDADE_ACD (id, acude_id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (4, 1, '03/01/2018', 6, 8.4, 6, 1, 2.5);

	/* DEMAIS ACUDES */
	INSERT INTO M_QUALIDADE_ACD (id, acude_id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (5, 2, '05/11/2017', 4, 10.5, 2, 2, 2);
	INSERT INTO M_QUALIDADE_ACD (id, acude_id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (6, 3, '05/11/2017', 12, 2.5, 7, 1, 1.2);
	INSERT INTO M_QUALIDADE_ACD (id, acude_id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (7, 4, '01/12/2018', 10, 4.7, 5, 2, 1.5);
	INSERT INTO M_QUALIDADE_ACD (id, acude_id, data, ph, dbo, turbidez, oxigenio, alcalinidade) VALUES (8, 4, '07/12/2018', 10, 4.7, 5, 2, 1.5);

/* INSERTS E_DE_QUALIDADE */

	/* ESTACOES RELACIONADAS COM ACUDES */

		/* MEDICOES ACUDE BODOCONGO */
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_acd_id, nome, latitude, longitude) VALUES (1, 1, 'Estação de galinhas', 11.5, 71.9);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_acd_id, nome, latitude, longitude) VALUES (2, 2, 'Estação de galinhas', 11.5, 71.9);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_acd_id, nome, latitude, longitude) VALUES (3, 3, 'Estação de galinhas', 11.5, 71.9);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_acd_id, nome, latitude, longitude) VALUES (4, 4, 'Estação de galinhas', 11.5, 71.9);

		/* MEDICOES DEMAIS ACUDES */
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_acd_id, nome, latitude, longitude) VALUES (5, 5, 'Estação de porcos', 21.5, 37.7);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_acd_id, nome, latitude, longitude) VALUES (6, 6, 'Estação de bois', 47.2, 15.1);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_acd_id, nome, latitude, longitude) VALUES (7, 7, 'Estação de peixes', 81.5, 81.2);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_acd_id, nome, latitude, longitude) VALUES (8, 8, 'Estação de serpentes', 37.5, 27.1);

	/* ESTACOES RELACIONADAS COM RIOS */

		/* ESTACAO APENAS RIO AMAZONAS */
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (9, 1, 'Estação de peixes', 81.5, 81.2);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (10, 2, 'Estação de peixes', 81.5, 81.2);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (11, 3, 'Estação de peixes', 81.5, 81.2);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (12, 4, 'Estação de peixes', 81.5, 81.2);

		/* ESTACAO AMAZONAS */
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (13, 5, 'Estação de peixes', 81.5, 81.2);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (14, 6, 'Estação de peixes', 81.5, 81.2);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (15, 7, 'Estação de peixes', 81.5, 81.2);

		/* ESTACAO NORDESTE */
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (16, 8, 'Estação de serpentes', 37.5, 27.1);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (17, 9, 'Estação de serpentes', 37.5, 27.1);

		/* ESTACAO SUDOESTE */
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (18, 10, 'Estação de bois', 47.2, 15.1);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (19, 11, 'Estação de bois', 47.2, 15.1);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (20, 12, 'Estação de bois', 47.2, 15.1);
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (21, 13, 'Estação de bois', 47.2, 15.1);

		/* ESTACAO URUGUAI */
		INSERT INTO E_DE_QUALIDADE (id, m_qualidade_rio_id, nome, latitude, longitude) VALUES (22, 14, 'Estação de porcos', 21.5, 37.7);

/* INSERTS COTA_AREA_VOLUME */

	/* COTAS PARA ACUDE BODOCONGO */
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (1, 1, 280, 251, 12516);
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (2, 1, 370, 251, 201087);
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (3, 1, 468, 251, 7217);
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (4, 1, 528, 251, 9150);
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (5, 1, 528, 251, 7217);

	/* COTA DEMAIS ACUDES */
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (6, 2, 128, 261, 371000);
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (7, 2, 312, 261, 297000);
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (8, 3, 471, 57.6, 128000);
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (9, 4, 661, 37.5, 51000);
	INSERT INTO COTA_AREA_VOLUME (id, acude_id, cota, area, volume) VALUES (10, 5, 715, 17.7, 8000);

/* INSERTS P_PLUVIOMETRICO */

	INSERT INTO P_PLUVIOMETRICO (id, bacia_id, nome, endereco) VALUES (1, 1, 'Posto potiguar', 'Rio Grande Norte');
	INSERT INTO P_PLUVIOMETRICO (id, bacia_id, nome, endereco) VALUES (2, 4, 'Posto paraibano', 'Paraiba');
	INSERT INTO P_PLUVIOMETRICO (id, bacia_id, nome, endereco) VALUES (3, 1, 'Posto pernambucano', 'Pernambuco');
	INSERT INTO P_PLUVIOMETRICO (id, bacia_id, nome, endereco) VALUES (4, 3, 'Posto paulista', 'São Paulo');
	INSERT INTO P_PLUVIOMETRICO (id, bacia_id, nome, endereco) VALUES (5, 5, 'Posto uruguaio', 'Rio de Janeiro');

/* INSERTS CONTRIBUI */

	INSERT INTO CONTRIBUI (acude_id, p_pluviometrico_id) VALUES (1, 1);
	INSERT INTO CONTRIBUI (acude_id, p_pluviometrico_id) VALUES (2, 2);
	INSERT INTO CONTRIBUI (acude_id, p_pluviometrico_id) VALUES (3, 3);
	INSERT INTO CONTRIBUI (acude_id, p_pluviometrico_id) VALUES (4, 4);
	INSERT INTO CONTRIBUI (acude_id, p_pluviometrico_id) VALUES (5, 5);

/* INSERTS USUARIO */

	INSERT INTO USUARIO (matricula, nome) VALUES (1, 'José');
	INSERT INTO USUARIO (matricula, nome) VALUES (2, 'Leonardo');
	INSERT INTO USUARIO (matricula, nome) VALUES (3, 'Donatello');
	INSERT INTO USUARIO (matricula, nome) VALUES (4, 'Raphael');
	INSERT INTO USUARIO (matricula, nome) VALUES (5, 'Michelangelo');
	INSERT INTO USUARIO (matricula, nome) VALUES (6, 'Splinter');

/* INSERTS TELEFONES_USUARIO */

	INSERT INTO TELEFONES_USUARIO (ddd, numero, matricula, usuario_matricula) VALUES (83, 111111111, 1, 1);
	INSERT INTO TELEFONES_USUARIO (ddd, numero, matricula, usuario_matricula) VALUES (83, 222222222, 1, 1);
	INSERT INTO TELEFONES_USUARIO (ddd, numero, matricula, usuario_matricula) VALUES (53, 333333333, 2, 2);
	INSERT INTO TELEFONES_USUARIO (ddd, numero, matricula, usuario_matricula) VALUES (87, 444444444, 3, 3);
	INSERT INTO TELEFONES_USUARIO (ddd, numero, matricula, usuario_matricula) VALUES (55, 555555555, 4, 4);
	INSERT INTO TELEFONES_USUARIO (ddd, numero, matricula, usuario_matricula) VALUES (26, 666666666, 5, 5);
	INSERT INTO TELEFONES_USUARIO (ddd, numero, matricula, usuario_matricula) VALUES (21, 777777777, 6, 6);
	INSERT INTO TELEFONES_USUARIO (ddd, numero, matricula, usuario_matricula) VALUES (21, 888888888, 6, 6);

/* INSERTS M_COTA_DIARIA */

	/* COTAS USUARIO JOSÉ */
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (1, 1, 1, 97.1, '11/01/2017');
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (2, 2, 1, 11.1, '12/11/2017');
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (3, 1, 1, 47.5, '12/05/2017');
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (4, 1, 1, 81, '12/17/2017');
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (5, 2, 1, 15.7, '08/01/2018');

	/* DEMAIS COTAS */
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (6, 2, 2, 15, '08/11/2017');
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (7, 4, 3, 16, '07/11/2017');
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (8, 2, 4, 17, '08/12/2017');
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (9, 2, 5, 18, '12/12/2017');
	INSERT INTO M_COTA_DIARIA (id, acude_id, usuario_matricula, cota_atual, data) VALUES (10, 1, 6, 19, '12/12/2017');

/* INSERTS BATIMETRIA */

	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (1, '01/11/2017', 1);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (2, '05/11/2017', 0.5);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (3, '07/12/2017', 2.0);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (4, '11/12/2017', 2.5);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (5, '03/01/2018', 2.1);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (6, '01/02/2018', 1.7);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (7, '03/02/2018', 1.7);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (8, '12/02/2018', 1.1);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (9, '03/06/2018', 0.8);
	INSERT INTO BATIMETRIA (id, data, valor_chuva) VALUES (10, '08/03/2018', 1.9);

/* INSERTS M_PLUVIOMETRICA */

	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (1, 1, 1, 1);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (2, 2, 2, 2);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (3, 3, 1, 1);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (4, 4, 5, 3);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (5, 5, 1, 1);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (6, 6, 3, 4);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (7, 7, 1, 1);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (8, 8, 2, 2);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (9, 9, 1, 2);
	INSERT INTO M_PLUVIOMETRICA (id, batimetria_id, p_pluviometrico_id, usuario_matricula) VALUES (10, 10, 2, 2);
