PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS MEDICO;
DROP TABLE IF EXISTS ENFERMEIRO;
DROP TABLE IF EXISTS TECNICO;
DROP TABLE IF EXISTS ESPECIALIDADE;
DROP TABLE IF EXISTS CONSULTA;
DROP TABLE IF EXISTS SALA_DE_EXAME;
DROP TABLE IF EXISTS EQUIPAMENTO;
DROP TABLE IF EXISTS UTENTE;
DROP TABLE IF EXISTS INTERNAMENTO;
DROP TABLE IF EXISTS R_MEDICO_ESPECIALIDADE;
DROP TABLE IF EXISTS R_ESPECIALIDADE_EQUIPAMENTO;
DROP TABLE IF EXISTS R_EQUIPAMENTO_SALA_DE_EXAME;
DROP TABLE IF EXISTS R_MANUTENCAO;
DROP TABLE IF EXISTS R_ENFERMEIRO_INTERNAMENTO;

CREATE TABLE FUNCIONARIO(
    numeroDeFuncionario INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    dataDeNascimento DATE,
    inicioDeFuncoes DATE
);

CREATE TABLE MEDICO(
    numeroDeFuncionario INTEGER NOT NULL,
    PRIMARY KEY (numeroDeFuncionario),
    CONSTRAINT MEDICO_FUNCIONARIO_FK FOREIGN KEY(numeroDeFuncionario) REFERENCES FUNCIONARIO(numeroDeFuncionario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ENFERMEIRO(
    numeroDeFuncionario INTEGER NOT NULL,
    PRIMARY KEY (numeroDeFuncionario),
    CONSTRAINT MEDICO_FUNCIONARIO_FK FOREIGN KEY(numeroDeFuncionario) REFERENCES FUNCIONARIO(numeroDeFuncionario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TECNICO(
    numeroDeFuncionario INTEGER NOT NULL,
    PRIMARY KEY (numeroDeFuncionario),
    CONSTRAINT MEDICO_FUNCIONARIO_FK FOREIGN KEY(numeroDeFuncionario) REFERENCES FUNCIONARIO(numeroDeFuncionario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ESPECIALIDADE(
    numeroDeEspecialidade INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nomeDeEspecialidade TEXT NOT NULL,
    andar INTEGER,
    alaHospitalar TEXT,
    numeroDeSalas INTEGER,
    lider INTEGER NOT NULL REFERENCES MEDICO(numeroDeFuncionario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE UTENTE(
    numeroDeUtente INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    dataDeNascimento DATE
);

CREATE TABLE SALA_DE_EXAME(
    numeroDaSala INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    area INTEGER,
    numeroDeEspecialidade INTEGER NOT NULL REFERENCES ESPECIALIDADE(numeroDeEspecialidade) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CONSULTA(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    data DATE,
    razao TEXT,
    nivelDeUrgencia TEXT,
    medico INTEGER NOT NULL REFERENCES MEDICO(numeroDeFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
    numeroDeEspecialidade INTEGER NOT NULL REFERENCES ESPECIALIDADE(numeroDeEspecialidade) ON DELETE CASCADE ON UPDATE CASCADE,
    utente INTEGER NOT NULL REFERENCES UTENTE(numeroDeUtente) ON DELETE CASCADE ON UPDATE CASCADE,
    sala INTEGER NOT NULL REFERENCES SALA_DE_EXAME(numeroDaSala) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT NIVEL_DE_URGENCIA_CHK CHECK(nivelDeUrgencia LIKE 'normal' OR nivelDeUrgencia LIKE 'grave' OR nivelDeUrgencia LIKE 'muito grave')
);

CREATE TABLE EQUIPAMENTO(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    tempoDeArmazenamento TIME,
    proximaDataAExpirar DATE
);

CREATE TABLE INTERNAMENTO(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    dataDeEntrada DATE,
    dataPrevistaDeAlta DATE,
    tratamento TEXT,
    numeroDoQuarto INTEGER,
    consulta INTEGER NOT NULL REFERENCES CONSULTA(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT DATE_CHK CHECK (dataPrevistaDeAlta > dataDeEntrada)
    --A data de entrada tem de ser igual ou posterior à data de consulta (restrição a ser implementada na próxima entrega).
);

CREATE TABLE R_MEDICO_ESPECIALIDADE(
    numeroDeFuncionario INTEGER NOT NULL,
    numeroDeEspecialidade INTEGER NOT NULL,
    PRIMARY KEY (numeroDeFuncionario, numeroDeEspecialidade),
    CONSTRAINT R_MEDICO_ESPECIALIDADE_MEDICO_FK FOREIGN KEY(numeroDeFuncionario) REFERENCES MEDICO(numeroDeFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT R_MEDICO_ESPECIALIDADE_ESPECIALIDADE_FK FOREIGN KEY(numeroDeEspecialidade) REFERENCES ESPECIALIDADE(numeroDeEspecialidade) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE R_ESPECIALIDADE_EQUIPAMENTO(
    numeroDeEspecialidade INTEGER NOT NULL,
    equipamento INTEGER NOT NULL,
    exemplaresEmStock INTEGER,
    PRIMARY KEY (numeroDeEspecialidade, equipamento),
    CONSTRAINT R_ESPECIALIDADE_EQUIPAMENTO_EQUIMAPENTO_FK FOREIGN KEY(equipamento) REFERENCES EQUIPAMENTO(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT R_ESPECIALIDADE_EQUIPAMENTO_ESPECIALIDADE_FK FOREIGN KEY(numeroDeEspecialidade) REFERENCES ESPECIALIDADE(numeroDeEspecialidade) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE R_EQUIPAMENTO_SALA_DE_EXAME(
    equipamento INTEGER NOT NULL,
    sala INTEGER NOT NULL,
    exemplaresDisponiveis INTEGER,
    PRIMARY KEY(equipamento, sala),
    CONSTRAINT R_EQUIPAMENTO_SALA_DE_EXAME_EQIPAMENTO_FK FOREIGN KEY(equipamento) REFERENCES EQUIPAMENTO(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT R_EQUIPAMENTO_SALA_DE_EXAME_SALA_DE_EXAME_FK FOREIGN KEY(sala) REFERENCES SALA_DE_EXAME(numeroDaSala) ON DELETE CASCADE ON UPDATE CASCADE
    --O número de exemplares disponíveis não deve exceder o número de exemplares em stock (restrição a ser implementada na próxima entrega).
);

CREATE TABLE R_MANUTENCAO(
    tecnico INTEGER NOT NULL,
    sala INTEGER NOT NULL,
    PRIMARY KEY (tecnico, sala),
    CONSTRAINT R_MANUTENCAO_TECNICO_FK FOREIGN KEY(tecnico) REFERENCES TECNICO(numeroDeFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT R_MANUTENCAO_SALA_DE_EXAME_FK FOREIGN KEY(sala) REFERENCES SALA_DE_EXAME(numeroDaSala) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE R_ENFERMEIRO_INTERNAMENTO(
    enfermeiro INTEGER NOT NULL,
    internamento INTEGER NOT NULL,
    PRIMARY KEY (enfermeiro, internamento),
    CONSTRAINT R_ENFERMEIRO_INTERNAMENTO_ENFERMEIRO_FK FOREIGN KEY(enfermeiro) REFERENCES ENFERMEIRO(numeroDeFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT R_ENFERMEIRO_INTERNAMENTO_INTERNAMENTO_FK FOREIGN KEY(internamento) REFERENCES INTERNAMENTO(id) ON DELETE CASCADE ON UPDATE CASCADE
);
