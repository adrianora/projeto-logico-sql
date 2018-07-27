
/**
    - Projeto Lógico, Banco de Dados 1, 21/12/2017
    - Professor: Cláudio Baptista
    - Monitoria: Brunna Amorim
    - Identificador do Grupo: 10
    - Equipe:   Adriano Ribeiro,
                Agnaldo Junior,
                Dayvson Weslley,
                Rubens Batista,
                Matheus Melo,
                Wesley Anibal
**/

CREATE TABLE batimetria
  (
     id         INTEGER NOT NULL,
     data_2     DATE,
     valorchuva DECIMAL,
     PRIMARY KEY(id)
  );

CREATE TABLE usuario
  (
     matricula INTEGER NOT NULL,
     nome      VARCHAR(30),
     PRIMARY KEY(matricula)
  );

CREATE TABLE m_qualidade_rio
  (
     id           INTEGER NOT NULL,
     data_2       DATE,
     ph           DECIMAL,
     dbo          DECIMAL,
     turbidez     DECIMAL,
     oxigenio     DECIMAL,
     alcalinidade DECIMAL,
     PRIMARY KEY(id)
  );

CREATE TABLE bacia
  (
     id        INTEGER NOT NULL,
     nome      VARCHAR(30),
     area      DECIMAL,
     perimetro DECIMAL,
     PRIMARY KEY(id)
  );

CREATE TABLE p_pluviometrico
  (
     id       INTEGER NOT NULL,
     bacia_id INTEGER NOT NULL,
     nome     VARCHAR(30),
     endereco VARCHAR(100),
     PRIMARY KEY(id),
     FOREIGN KEY(bacia_id) REFERENCES bacia(id)
  );

CREATE INDEX p_pluviometrico_fkindex1
  ON p_pluviometrico (bacia_id);

CREATE INDEX ifk_eh_monitorada
  ON p_pluviometrico (bacia_id);

CREATE TABLE telefones_usuario
  (
     ddd               CHAR(2) NOT NULL,
     numero            VARCHAR(9) NOT NULL,
     matricula         INTEGER NOT NULL,
     usuario_matricula INTEGER NOT NULL,
     PRIMARY KEY(ddd, numero, matricula),
     FOREIGN KEY(usuario_matricula) REFERENCES usuario(matricula)
  );

CREATE INDEX t_usuario_fkindex1
  ON telefones_usuario (usuario_matricula);

CREATE INDEX ifk_tem
  ON telefones_usuario (usuario_matricula);

CREATE TABLE rio
  (
     id                 INTEGER NOT NULL,
     m_qualidade_rio_id INTEGER NOT NULL,
     bacia_id           INTEGER NOT NULL,
     nome               VARCHAR(30),
     indicativo         VARCHAR(30),
     PRIMARY KEY(id, m_qualidade_rio_id),
     FOREIGN KEY(bacia_id) REFERENCES bacia(id),
     FOREIGN KEY(m_qualidade_rio_id) REFERENCES m_qualidade_rio(id)
  );

CREATE INDEX rio_fkindex1
  ON rio (bacia_id);

CREATE INDEX rio_fkindex2
  ON rio (m_qualidade_rio_id);

CREATE INDEX ifk_eh_formada
  ON rio (bacia_id);

CREATE INDEX ifk_rio_eh_medido
  ON rio (m_qualidade_rio_id);

CREATE TABLE m_pluviometrica
  (
     id                 INTEGER NOT NULL,
     batimetria_id      INTEGER NOT NULL,
     p_pluviometrico_id INTEGER NOT NULL,
     usuario_matricula  INTEGER NOT NULL,
     PRIMARY KEY(id),
     FOREIGN KEY(batimetria_id) REFERENCES batimetria(id),
     FOREIGN KEY(usuario_matricula) REFERENCES usuario(matricula),
     FOREIGN KEY(p_pluviometrico_id) REFERENCES p_pluviometrico(id)
  );

CREATE INDEX m_pluviometrica_fkindex1
  ON m_pluviometrica (batimetria_id);

CREATE INDEX m_pluviometrica_fkindex2
  ON m_pluviometrica (usuario_matricula);

CREATE INDEX m_pluviometrica_fkindex3
  ON m_pluviometrica (p_pluviometrico_id);

CREATE INDEX ifk_rel_08
  ON m_pluviometrica (batimetria_id);

CREATE INDEX ifk_eh_realizada
  ON m_pluviometrica (usuario_matricula);

CREATE INDEX ifk_registra
  ON m_pluviometrica (p_pluviometrico_id);

CREATE TABLE acude
  (
     id                     INTEGER NOT NULL,
     rio_m_qualidade_rio_id INTEGER NOT NULL,
     rio_id                 INTEGER NOT NULL,
     nome                   VARCHAR(30),
     volumemaximo           DECIMAL,
     comprimentro           DECIMAL,
     area                   DECIMAL,
     PRIMARY KEY(id),
     FOREIGN KEY(rio_id, rio_m_qualidade_rio_id) REFERENCES rio(id,
     m_qualidade_rio_id)
  );

CREATE INDEX acude_fkindex1
  ON acude (rio_id, rio_m_qualidade_rio_id);

CREATE INDEX ifk_forma
  ON acude (rio_id, rio_m_qualidade_rio_id);

CREATE TABLE contribui
  (
     acude_id           INTEGER NOT NULL,
     p_pluviometrico_id INTEGER NOT NULL,
     PRIMARY KEY(acude_id, p_pluviometrico_id),
     FOREIGN KEY(p_pluviometrico_id) REFERENCES p_pluviometrico(id),
     FOREIGN KEY(acude_id) REFERENCES acude(id)
  );

CREATE INDEX p_pluvi_has_acude_fkindex1
  ON contribui (p_pluviometrico_id);

CREATE INDEX p_pluvi_has_acude_fkindex2
  ON contribui (acude_id);

CREATE INDEX ifk_contribui_com
  ON contribui (p_pluviometrico_id);

CREATE INDEX ifk_eh_contribuido
  ON contribui (acude_id);

CREATE TABLE m_cota_diaria
  (
     id                INTEGER NOT NULL,
     acude_id          INTEGER NOT NULL,
     usuario_matricula INTEGER NOT NULL,
     cotaatual         DECIMAL,
     data_2            DATE,
     PRIMARY KEY(id),
     FOREIGN KEY(acude_id) REFERENCES acude(id),
     FOREIGN KEY(usuario_matricula) REFERENCES usuario(matricula)
  );

CREATE INDEX m_cota_diaria_fkindex1
  ON m_cota_diaria (acude_id);

CREATE INDEX m_cota_diaria_fkindex2
  ON m_cota_diaria (usuario_matricula);

CREATE INDEX ifk_possui
  ON m_cota_diaria (acude_id);

CREATE INDEX ifk_realiza
  ON m_cota_diaria (usuario_matricula);

CREATE TABLE m_qualidade_acd
  (
     id           INTEGER NOT NULL,
     acude_id     INTEGER NOT NULL,
     data_2       DECIMAL,
     ph           DECIMAL,
     dbo          DECIMAL,
     turbidez     DECIMAL,
     oxigenio     DECIMAL,
     alcalinidade DECIMAL,
     PRIMARY KEY(id, acude_id),
     FOREIGN KEY(acude_id) REFERENCES acude(id)
  );

CREATE INDEX m_qualidade_rio_2_fkindex1
  ON m_qualidade_acd (acude_id);

CREATE INDEX ifk_acude_eh_medido
  ON m_qualidade_acd (acude_id);

CREATE TABLE cota_area_volume
  (
     id       INTEGER NOT NULL,
     acude_id INTEGER NOT NULL,
     cota     DECIMAL,
     area     DECIMAL,
     volume   DECIMAL,
     PRIMARY KEY(id),
     FOREIGN KEY(acude_id) REFERENCES acude(id)
  );

CREATE INDEX c_a_v_fkindex1
  ON cota_area_volume (acude_id);

CREATE INDEX ifk_tem
  ON cota_area_volume (acude_id);

CREATE TABLE e_de_qualidade
  (
     id                       INTEGER NOT NULL,
     m_qualidade_acd_id       INTEGER NOT NULL,
     m_qualidade_acd_acude_id INTEGER NOT NULL,
     m_qualidade_rio_id       INTEGER NOT NULL,
     nome                     VARCHAR(30),
     latitude                 DECIMAL,
     longitude                DECIMAL,
     PRIMARY KEY(id),
     FOREIGN KEY(m_qualidade_acd_acude_id, m_qualidade_acd_id) REFERENCES
     m_qualidade_acd(acude_id, id),
     FOREIGN KEY(m_qualidade_rio_id) REFERENCES m_qualidade_rio(id)
  );

CREATE INDEX e_de_qualidade_fkindex1
  ON e_de_qualidade (m_qualidade_acd_acude_id, m_qualidade_acd_id);

CREATE INDEX e_de_qualidade_fkindex2
  ON e_de_qualidade (m_qualidade_rio_id);

CREATE INDEX ifk_mede_qualidade_acude
  ON e_de_qualidade (m_qualidade_acd_acude_id, m_qualidade_acd_id);

CREATE INDEX ifk_mede_qualidade_rio
  ON e_de_qualidade (m_qualidade_rio_id); 