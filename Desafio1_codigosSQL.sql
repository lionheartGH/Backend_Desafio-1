--#region Informações
/*
Aluno: Willian Martins Gonçalves
RA: E34642

As Tables, registros e as demandas do desafio seguem abaixo separadas em regiões para melhor visibilidade
*/
--#endregion

--#region Tables

/* Aluno */
CREATE TABLE aluno (
ra INT PRIMARY KEY NOT NULL,
nome VARCHAR(255) NOT NULL,
cpf VARCHAR(11) NOT NULL,
DataNascimento DATE,
sexo CHAR(1),
escolariedade VARCHAR(255)
);

/* Professor */
CREATE TABLE professor (
idprof INT PRIMARY KEY NOT NULL,
nome VARCHAR(255) NOT NULL,
cpf VARCHAR(14) NOT NULL,
DataNascimento DATE,
sexo CHAR(1),
Titulacao VARCHAR(255)
);

/* Periodo */
CREATE TABLE periodo (
idperiodo SERIAL PRIMARY KEY,
inicio DATE NOT NULL,
fim DATE NOT NULL
);

/* Curso */
CREATE TABLE curso (
idcurso SERIAL PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
valor NUMERIC(15,2) NOT NULL,
cargahoraria INT NOT NULL,
statuscurso CHAR(1) NOT NULL,
professorid INT NOT NULL,
periodoid INT NOT NULL,
FOREIGN KEY (professorid) REFERENCES professor(idprof),
FOREIGN KEY (periodoid) REFERENCES periodo(idperiodo)
);

/* Matricula */
CREATE TABLE matricula (
id SERIAL PRIMARY KEY,
ra INT NOT NULL,
idcurso SERIAL NOT NULL,
datamatricula DATE,
n1 DECIMAL(4,2),
n2 DECIMAL(4,2),
n3 DECIMAL(4,2),
resultado CHAR(1),
FOREIGN KEY (idcurso) REFERENCES curso(idcurso)
);
--#endregion

--#region Registros

/* Alunos */
INSERT INTO aluno (ra, nome, cpf, dataNascimento, sexo, escolariedade)
VALUES ('12345', 'Fulano Silvano', '19816800001', '01-01-2000', 'M', 'Ensino Medio');

INSERT INTO aluno (ra, nome, cpf, dataNascimento, sexo, escolariedade)
VALUES ('67890', 'Elon Musk', '19616740402', '01-01-1978', 'M', 'Ensino Superior');

INSERT INTO aluno (ra, nome, cpf, dataNascimento, sexo, escolariedade)
VALUES ('86522', 'Leonardo Dicaprio', '29626750502', '28-05-1975', 'M', 'Ensino Superior');

INSERT INTO aluno (ra, nome, cpf, dataNascimento, sexo, escolariedade)
VALUES ('63825', 'Taylor Swift', '16656719422', '14-11-1985', 'F', 'Ensino Medio');

INSERT INTO aluno (ra, nome, cpf, dataNascimento, sexo, escolariedade)
VALUES ('22351', 'Rita Lee', '67514140401', '31-10-1960', 'F', 'Ensino Superior');

INSERT INTO aluno (ra, nome, cpf, dataNascimento, sexo, escolariedade)
VALUES ('81522', 'Roberto da Silva', '89826850502', '28-09-1990', 'M', 'Ensino Superior');

INSERT INTO aluno (ra, nome, cpf, dataNascimento, sexo, escolariedade)
VALUES ('86512', 'Ana dos Santos', '99896859509', '15-01-2000', 'F', 'Ensino Superior');

/* Professores */
INSERT INTO professor (idprof, nome, cpf, DataNascimento, sexo, Titulacao)
VALUES ('62334', 'Joaquin Phoenix', '67514373421', '08-06-1980', 'M', 'Mestre');

INSERT INTO professor (idprof, nome, cpf, DataNascimento, sexo, Titulacao)
VALUES ('12329', 'Alceu Valenca', '31512373551', '02-09-1974', 'M', 'Doutorado');

INSERT INTO professor (idprof, nome, cpf, DataNascimento, sexo)
VALUES ('53791', 'Chris Rock', '31592973991', '22-03-1968', 'M');

INSERT INTO professor (idprof, nome, cpf, DataNascimento, sexo, Titulacao)
VALUES ('29234', 'Christiano Ronaldo', '91912373533', '10-09-1984', 'M', 'Doutorado');

INSERT INTO professor (idprof, nome, cpf, DataNascimento, sexo, Titulacao)
VALUES ('10529', 'Harry Potter', '32514173858', '08-08-1990', 'M', 'Doutorado');

INSERT INTO professor (idprof, nome, cpf, DataNascimento, sexo, Titulacao)
VALUES ('10528', 'João Pereira', '22524173252', '12-02-1989', 'M', 'Mestre');

INSERT INTO professor (idprof, nome, cpf, DataNascimento, sexo, Titulacao)
VALUES ('10227', 'Lilia Silva', '22525173555', '10-09-1988', 'F', 'Mestre');

/* Periodos */
INSERT INTO periodo (inicio, fim)
VALUES ('29-11-2023', '29-03-2024');

INSERT INTO periodo (inicio, fim)
VALUES ('30-03-2024', '30-06-2024');

INSERT INTO periodo (inicio, fim)
VALUES ('30-03-2022', '30-06-2022');

/* Cursos */
INSERT INTO curso (nome, valor, cargahoraria, statuscurso, professorid, periodoid)
VALUES ('Curso de Atuação', '1000.99', '100', 'A', '62334', '1');

INSERT INTO curso (nome, valor, cargahoraria, statuscurso, professorid, periodoid)
VALUES ('Curso de Comedia', '500.99', '70', 'A', '53791', '1');

INSERT INTO curso (nome, valor, cargahoraria, statuscurso, professorid, periodoid)
VALUES ('Curso de Canto', '200.99', '20', 'I', '12329', '2');

INSERT INTO curso (nome, valor, cargahoraria, statuscurso, professorid, periodoid)
VALUES ('Curso de Bruxaria', '2000.99', '200', 'I', '10529', '2');

INSERT INTO curso (nome, valor, cargahoraria, statuscurso, professorid, periodoid)
VALUES ('Curso de Engenharia', '1990.99', '260', 'A', '10227', '1');

/* Matriculas */
INSERT INTO matricula (ra, idcurso, datamatricula, n1, n2, n3, resultado)
VALUES ('12345', '1', '29-11-2023', '1', '2', '3', 'R');

INSERT INTO matricula (ra, idcurso, datamatricula, n1, n2, n3, resultado)
VALUES ('12345', '5', '29-11-2023', '2', '3', '4', 'R');

INSERT INTO matricula (ra, idcurso, datamatricula, n1, n2, n3, resultado)
VALUES ('67890', '2', '30-11-2023', '10', '10', '10', 'A');

INSERT INTO matricula (ra, idcurso, datamatricula, n1, n2, n3, resultado)
VALUES ('86522', '1', '28-11-2023', '10', '9', '10', 'A');

INSERT INTO matricula (ra, idcurso, datamatricula, n1, n2, n3, resultado)
VALUES ('63825', '3', '28-11-2023', '0', '0', '0', 'R');

INSERT INTO matricula (ra, idcurso, datamatricula, n1, n2, n3, resultado)
VALUES ('22351', '4', '28-11-2023', '10', '10', '10', 'A');

INSERT INTO matricula (ra, idcurso, datamatricula, n1, n2, n3, resultado)
VALUES ('29234', '1', '28-11-2023', '7', '7', '6', 'A');

INSERT INTO matricula (ra, idcurso, datamatricula, n1, n2, n3, resultado)
VALUES ('81522', '5', '28-11-2023', '6', '6', '9', 'A');
--#endregion

--#region Demandas

/* b) Criação de um campo e-mail para professor  de preenchimento obrigatório; */
ALTER TABLE professor
ADD email VARCHAR(255) NOT NULL DEFAULT 'prof@prof.com'; /* Default para evitar erro caso ja tenha criado registros */

    /* Registro para teste */
    INSERT INTO professor (idprof, nome, cpf, DataNascimento, sexo, Titulacao, email)
    VALUES ('11118', 'Tom Sawyer', '91919191919', '05-10-1973', 'M', 'Doutorado', 'rush@hotmail.com');

/* c) Insira um campo e-mail para aluno, também de preenchimento obrigatório; */
ALTER TABLE aluno
ADD email VARCHAR(255) NOT NULL DEFAULT 'aluno@aluno.com'; /* Default para evitar erro caso ja tenha criado registros */

    /* Registro para teste */
    INSERT INTO aluno (ra, nome, cpf, dataNascimento, sexo, escolariedade, email)
    VALUES ('99999', 'Mark Zuckerberg', '19888888001', '17-02-1982', 'M', 'Ensino Medio', 'fbook@gmail.com');

/* d) Criação de índices para os professores e alunos pelos seus CPFs; */
SELECT cpf, nome FROM aluno
UNION
SELECT cpf, nome FROM professor
ORDER BY cpf, nome;

/* f) Altere eventuais cadastros de professores cuja titulação esteja como “Mestre” para “Mestrado”; */
UPDATE professor
SET titulacao = 'Mestrado'
WHERE titulacao = 'Mestre';

/* g) Como o projeto teve início em 2023, desconsiderando eventuais restrições, exclua os períodos letivos de anos anteriores; */
DELETE FROM periodo
where fim <= '01-01-2023';

/* h) Para uma campanha de saúde da mulher é necessário listar todos as alunas em ordem alfabética (ra, nome e e-mail); */
SELECT ra, nome, email from aluno
WHERE sexo = 'F';

/* i) Listar todos os professores que tenham sua titulação não preenchida; */
SELECT * FROM professor
WHERE titulacao IS NULL;

/* j) Como exemplo de relatório, listar ra, nome e cpf e data de matrícula de todos os alunos matriculados em um curso específico, listando o nome e carga horária do mesmo; */
SELECT a.ra, a.nome, a.cpf, m.datamatricula, c.nome AS Nome_do_curso, c.cargahoraria AS carga_horaria FROM aluno a
JOIN matricula m ON a.ra = m.ra
JOIN curso c ON m.idcurso = c.idcurso
WHERE c.nome = 'Curso de Atuação';

/* k) Em outro, listar todos o nome do curso , carga_horária e valor, nome do professor, titulação do professor de todos os curso ofertados em um determinado período; */
SELECT c.nome, c.cargahoraria, c.valor, pr.nome, pr.titulacao FROM curso c
JOIN professor pr
ON c.professorid = pr.idprof
JOIN periodo pe
ON c.periodoid = pe.idperiodo
WHERE pe.inicio >= '29-11-2023' AND pe.fim <= '29-03-2024'

/* l) Como é comum em homenagens, listar todos os alunos (nome e e-mail) de todos os alunos de um professor específico; */
SELECT a.nome, a.email, p.nome FROM aluno a
JOIN matricula m ON a.ra = m.ra
JOIN curso c ON m.idcurso = c.idcurso
JOIN professor p ON c.professorid = p.idprof
WHERE p.nome = 'Joaquin Phoenix'

/* m) Gerar o boletim do aluno, com ra, nome, cpf do aluno, nome do curso, nota final e resultado final de todos os alunos aprovados; */
SELECT a.ra, a.nome, a.cpf, c.nome AS curso, (m.n1 + m.n2 + m.n3) AS Nota_Final, m.resultado FROM aluno A
JOIN matricula m ON a.ra = m.ra
JOIN curso c ON m.idcurso = c.idcurso
WHERE m.resultado = 'A'

/* n)  Listar a quantidade de alunos por curso em um determinado período de oferta;*/
SELECT c.nome, COUNT(DISTINCT a.ra) AS quantidade FROM curso c
JOIN matricula m ON c.idcurso = m.idcurso
JOIN periodo p ON c.periodoid = p.idperiodo
JOIN aluno a ON m.ra = a.ra
WHERE p.inicio >= '29-11-2023' AND p.fim <= '29-03-2024'
GROUP BY c.nome

/* o) Informar o valor do curso mais caro, do curso mais barato e o valor médio dos cursos; */
SELECT MAX(valor) as mais_caro, MIN(valor) as mais_barato, AVG(valor) as media FROM curso

/* p) Informar o ticket médio dos cursos em um determinado período de oferta; */
SELECT AVG(c.valor) as ticket_medio FROM curso c
JOIN periodo p ON c.periodoid = p.idperiodo
WHERE p.inicio >= '29-11-2023' AND p.fim <= '29-03-2024'

/* q) Para incentivo do corpo docente, listar nome e cpf de todos os professores que nunca foram alunos dos cursos ofertados; */
SELECT p.nome, p.cpf FROM professor p
WHERE p.idprof NOT IN (
    SELECT ra FROM matricula
)

/* r) Listar a quantidade de alunos do sexo masculino e a quantidade de alunos do sexo feminino matriculados nos cursos cuja mensalidade está acima do valor médio de todos os curso; */
WITH ValorMedio AS (
    SELECT AVG(valor) AS media_cursos
    FROM curso
)
SELECT a.sexo, COUNT(*) AS quantidade_alunos FROM aluno a
JOIN matricula m ON a.ra = m.ra
JOIN curso c ON m.idcurso = c.idcurso
JOIN ValorMedio ON c.valor > ValorMedio.media_cursos
GROUP BY a.sexo;
--#endregion