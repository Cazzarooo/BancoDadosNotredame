--Excluindo tabelas
DROP TABLE  tb_alergia CASCADE CONSTRAINTS;
DROP TABLE  tb_contato CASCADE CONSTRAINTS;
DROP TABLE  tb_historico_familiar CASCADE CONSTRAINTS;
DROP TABLE  tb_historico_medico CASCADE CONSTRAINTS;
DROP TABLE tb_atendimento CASCADE CONSTRAINTS;
DROP TABLE  tb_medicamento CASCADE CONSTRAINTS;
DROP TABLE  tb_paciente CASCADE CONSTRAINTS;
DROP TABLE  tb_urgencia CASCADE CONSTRAINTS;

--Excluindo os autoincrementos

DROP SEQUENCE  tb_urgencia_id_urgencia_seq;
DROP SEQUENCE tb_medicamento_id_medicamento_seq;
DROP SEQUENCE tb_alergia_id_alergia_seq;
DROP SEQUENCE tb_historico_familiar_id_historico_familiar_seq;


--Criando sequencias

CREATE SEQUENCE tb_urgencia_id_urgencia_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tb_medicamento_id_medicamento_seq START WITH 1 INCREMENT BY 1;     

CREATE SEQUENCE tb_alergia_id_alergia_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tb_historico_familiar_id_historico_familiar_seq START WITH 1 INCREMENT BY 1;


--Criação das Tabelas

CREATE TABLE tb_alergia (
    id_alergia   INTEGER DEFAULT tb_alergia_id_alergia_seq.nextval NOT NULL,
    nome_alergia VARCHAR2(100)
);

ALTER TABLE tb_alergia ADD CONSTRAINT tb_alergia_pk PRIMARY KEY ( id_alergia );

CREATE TABLE tb_atendimento (
    cpf_paciente        VARCHAR2(11) NOT NULL,
    id_urgencia         INTEGER NOT NULL,
    tipo_sintoma        VARCHAR2(500),
    intensidade_sintoma INTEGER
);

CREATE TABLE tb_contato (
    cpf_paciente    VARCHAR2(11) NOT NULL,
    numero_paciente INTEGER
);

CREATE TABLE tb_historico_familiar (
    id_historico_familiar INTEGER DEFAULT tb_historico_familiar_id_historico_familiar_seq.nextval NOT NULL,
    nome_doenca           VARCHAR2(100)
);

ALTER TABLE tb_historico_familiar ADD CONSTRAINT tb_historico_familiar_pk PRIMARY KEY ( id_historico_familiar );

CREATE TABLE tb_historico_medico (
    cpf_paciente          VARCHAR2(11) NOT NULL,
    id_historico_familiar INTEGER NOT NULL,
    id_medicamento        INTEGER NOT NULL,
    id_alergia            INTEGER NOT NULL
);

CREATE TABLE tb_medicamento (
    id_medicamento   INTEGER DEFAULT tb_medicamento_id_medicamento_seq.nextval NOT NULL,
    nome_medicamento VARCHAR2(100)
);

ALTER TABLE tb_medicamento ADD CONSTRAINT tb_medicamento_pk PRIMARY KEY ( id_medicamento );

CREATE TABLE tb_paciente (
    cpf_paciente      VARCHAR2(11) NOT NULL,
    nome_paciente     VARCHAR2(100),
    idade_paciente    INTEGER,
    sexo_paciente     VARCHAR2(50),
    endereco_paciente VARCHAR2(200),
    senha             VARCHAR2(50)
);

ALTER TABLE tb_paciente ADD CONSTRAINT tb_paciente_pk PRIMARY KEY ( cpf_paciente );

CREATE TABLE tb_urgencia (
    id_urgencia   INTEGER DEFAULT tb_urgencia_id_urgencia_seq.nextval NOT NULL,
    nome_urgencia VARCHAR2(100)
);

ALTER TABLE tb_urgencia ADD CONSTRAINT tb_urgencia_pk PRIMARY KEY ( id_urgencia );

ALTER TABLE tb_atendimento
    ADD CONSTRAINT tb_atendimento_tb_paciente_fk FOREIGN KEY ( cpf_paciente )
        REFERENCES tb_paciente ( cpf_paciente );

ALTER TABLE tb_atendimento
    ADD CONSTRAINT tb_atendimento_tb_urgencia_fk FOREIGN KEY ( id_urgencia )
        REFERENCES tb_urgencia ( id_urgencia );

ALTER TABLE tb_contato
    ADD CONSTRAINT tb_contato_tb_paciente_fk FOREIGN KEY ( cpf_paciente )
        REFERENCES tb_paciente ( cpf_paciente );

ALTER TABLE tb_historico_medico
    ADD CONSTRAINT tb_historico_medico_tb_alergia_fk FOREIGN KEY ( id_alergia )
        REFERENCES tb_alergia ( id_alergia );

ALTER TABLE tb_historico_medico
    ADD CONSTRAINT tb_historico_medico_tb_historico_familiar_fk FOREIGN KEY ( id_historico_familiar )
        REFERENCES tb_historico_familiar ( id_historico_familiar );

ALTER TABLE tb_historico_medico
    ADD CONSTRAINT tb_historico_medico_tb_medicamento_fk FOREIGN KEY ( id_medicamento )
        REFERENCES tb_medicamento ( id_medicamento );

ALTER TABLE tb_historico_medico
    ADD CONSTRAINT tb_historico_medico_tb_paciente_fk FOREIGN KEY ( cpf_paciente )
        REFERENCES tb_paciente ( cpf_paciente );

                 
--Inserindo valores na tabela paciente

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('12345678901', 'Breno Souza', 25, 'M', 'Rua 1','Breno123');

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('23456789012', 'Ana Silva', 28, 'F', 'Rua 2', 'Ana234');

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('34567890123', 'Carlos Oliveira', 35, 'M', 'Rua 3', 'Carlos345');

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('45678901234', 'Maria Santos', 40, 'F', 'Rua 4', 'Maria456');

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('56789012345', 'Fernando Pereira', 32, 'M', 'Rua 5', 'Fernando567');

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('67890123456', 'Juliana Lima', 27, 'F', 'Rua 6', 'Juliana678');

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('78901234567', 'Rodrigo Almeida', 45, 'M', 'Rua 7', 'Rodrigo789');

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('89012345678', 'Camila Rocha', 30, 'F', 'Rua 8', 'Camila890');

INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('90123456789', 'Lucas Martins', 38, 'M', 'Rua 9', 'Lucas901');
 
INSERT INTO tb_paciente (cpf_paciente, nome_paciente, idade_paciente, sexo_paciente, endereco_paciente, senha)
VALUES ('12345678909', 'Isabela Costa', 29, 'F', 'Rua 10', 'Isabela123');

--Inserindo valores na tabela contato

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('12345678901', 789456123);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('23456789012', 654321987);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('34567890123', 111222333);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('45678901234', 444555666);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('56789012345', 999888777);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('67890123456', 333222111);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('78901234567', 777888999);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('89012345678', 123456789);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('90123456789', 159753264);

INSERT INTO tb_contato (cpf_paciente, numero_paciente)
VALUES ('12345678909', 125874693);

--Inserindo valores na tabela Historico Familiar

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Hemofilia');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Distrofia Muscular');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Síndrome de Huntington');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Cist Fibrose');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Talassemia');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Fenilcetonúria');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Síndrome de Marfan');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Doença de Tay-Sachs');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Esclerose Múltipla');

INSERT INTO tb_historico_familiar (nome_doenca)
VALUES ('Hipercolesterolemia Familiar');

--Inserindo valores na tabela Alergia

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Rinite');

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Asma');

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Dermatite Atópica');

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Alergia a Frutos do Mar');

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Alergia a Amendoim');

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Alergia a Leite');

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Alergia a Pólen');

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Alergia a Látex');

INSERT INTO tb_alergia (nome_alergia)
VALUES ('Alergia a Picadas de Insetos');

INSERT INTO tb_alergia (nome_alergia) 
VALUES ('Alergia a Trigo');

--Inserindo valores na tabela Medicamento

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Dipirona');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Paracetamol');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Ibuprofeno');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Omeprazol');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Amoxicilina');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Ciprofloxacino');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Loratadina');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Ranitidina');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Cetirizina');

INSERT INTO tb_medicamento (nome_medicamento)
VALUES ('Metformina');

--Inserindo valores na tabela Urgencia

INSERT INTO tb_urgencia (nome_urgencia)
VALUES ('Não Urgente');

INSERT INTO tb_urgencia (nome_urgencia)
VALUES ('Pouco Urgente');

INSERT INTO tb_urgencia (nome_urgencia)
VALUES ('Urgente');

INSERT INTO tb_urgencia (nome_urgencia)
VALUES ('Muito Urgente');

INSERT INTO tb_urgencia (nome_urgencia)
VALUES ('Emergência');


--Inserindo valores na tabela atendimento

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('12345678901', 1, 'Febre', 2);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('23456789012', 2, 'Pressão Alta', 3);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('34567890123', 3, 'Dor de Cabeça', 1);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('45678901234', 4, 'Náuseas', 4);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('56789012345', 5, 'Tosse', 2);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('67890123456', 1, 'Fadiga', 3);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('78901234567', 2, 'Dor Abdominal', 1);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('89012345678', 3, 'Dor nas Articulações', 4);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('90123456789', 4, 'Dificuldade Respiratória', 2);

INSERT INTO tb_atendimento (cpf_paciente, id_urgencia, tipo_sintoma, intensidade_sintoma)
VALUES ('12345678909', 5, 'Insônia', 3);

--Inserindo valores na tabela Historico Medico

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('12345678901', 1, 1, 1);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('23456789012', 2, 2, 2);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('34567890123', 3, 3, 3);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('45678901234', 4, 4, 4);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('56789012345', 5, 5, 5);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('67890123456', 6, 6, 6);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('78901234567', 7, 7, 7);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('89012345678', 8, 8, 8);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('90123456789', 9, 9, 9);

INSERT INTO tb_historico_medico(cpf_paciente, id_historico_familiar, id_medicamento, id_alergia)
VALUES('12345678909', 10, 10, 10);

--Fazendo os Selects

--Obtendo informações dos pacientes que estão em espera pelo nome da urgencia.
SELECT
    COUNT(*) AS quantidade_pacientes_em_espera
FROM
    tb_atendimento
WHERE
    id_urgencia IN (
        SELECT id_urgencia
        FROM tb_urgencia
        WHERE nome_urgencia = 'Urgente'
    );

--Obter informações sobre os pacientes e seus contatos.
SELECT p.nome_paciente, c.numero_paciente
FROM tb_paciente p
JOIN tb_contato c ON p.cpf_paciente = c.cpf_paciente
ORDER BY p.nome_paciente;

-- Selecionando o nome, idade e endereço do paciente,bem como informações do histórico médico,
--incluindo histórico familiar, alergias e medicamentos associados.
SELECT
    p.nome_paciente,
    p.idade_paciente,
    p.endereco_paciente,
    hf.nome_doenca AS historico_familiar,
    a.nome_alergia AS alergia,
    m.nome_medicamento AS medicamento
FROM
    tb_paciente p
LEFT JOIN tb_historico_medico hm ON p.cpf_paciente = hm.cpf_paciente
LEFT JOIN tb_historico_familiar hf ON hm.id_historico_familiar = hf.id_historico_familiar
LEFT JOIN tb_alergia a ON hm.id_alergia = a.id_alergia
LEFT JOIN tb_medicamento m ON hm.id_medicamento = m.id_medicamento;


--Select que imputa o CPF e puxa as informações do atendimento.
SELECT p.cpf_paciente, a.id_urgencia, u.nome_urgencia, a.tipo_sintoma, a.intensidade_sintoma
FROM tb_atendimento a
JOIN tb_paciente p ON a.cpf_paciente = p.cpf_paciente
JOIN tb_urgencia u ON a.id_urgencia = u.id_urgencia
WHERE p.cpf_paciente = '12345678901';
