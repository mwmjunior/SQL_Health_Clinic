                      -- DML Data Manipulation Language --


USE Health_Clinic;


--  Usa o comando CREATE PROCEDURE para criar uma tabela de usuario com os parametros de  @email e @senha, define o tipo como paciente e insere as informacoes ralacionadas ao paciente .

CREATE PROCEDURE Cadastro_do_Paciente 
@Email VARCHAR(200) , @Senha VARCHAR(200),
@Nome VARCHAR(200) , @CPF CHAR(11), @RG CHAR(9), @Data_de_Nascimento DATE, @Endereco VARCHAR(200), @Numero_da_Residencia INT, @Telefone CHAR(11), @Sexo VARCHAR(200)
AS
BEGIN 
INSERT INTO Usuario(Email,Senha) VALUES(@Email,@Senha);
INSERT INTO Paciente(ID_Usuario,Nome,CPF,RG,Data_de_Nascimento,Endereco,Numero_da_Residencia,Telefone, Sexo) VALUES (SCOPE_IDENTITY(),@Nome,@CPF,@RG, @Data_de_Nascimento,@Endereco, @Numero_da_Residencia, @Telefone, @Sexo);
END

--------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC Cadastro_do_Paciente  'marcio@gmail.com' , 'password', 'Marcio' , '11111111111', '111111111', '1994-10-10', 'Rua' , '111111111', '111111111', 'Homem'
EXEC Cadastro_do_Paciente  'Gabriele@gmail.com' , 'password', 'Gabriela' , '11111111112', '111111112', '1995-10-10', 'Rua' , '111111111', '111111111', 'Mulher'

SELECT * FROM Paciente;
SELECT * FROM Usuario;
---------------------------------------------------------------------------------------------------------------------------------------------------------



-- Usa o comando CREATE PROCEDURE para criar uma tabela para os dados de localizcao da clinica

CREATE PROCEDURE Cadastro_da_Clinica   
@Nome_Fantasia VARCHAR(200), @Endereco VARCHAR(250), @Numero INT, @CEP CHAR(8), @Razao_Social VARCHAR(200) 
AS 
BEGIN 
INSERT INTO Clinica(Nome_Fantasia,Endereco,Numero,CEP,Razao_Social ) VALUES(@Nome_Fantasia,@Endereco,@Numero,@CEP,@Razao_Social);
END

---------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC Cadastro_da_Clinica 'HealthClinic', 'Rua', '12', '88888888', 'clinicasa'
SELECT * FROM Clinica;
---------------------------------------------------------------------------------------------------------------------------------------------------------



-- Usa o comando CREATE PROCEDURE para criar uma tabela de especialidade médica

CREATE PROCEDURE Cadastro_da_Especialidade_Medica @Especialidade_Medica VARCHAR(200)
AS 
BEGIN 
INSERT INTO Especialidade(Especialidade_Medica) VALUES (@Especialidade_Medica);
END

---------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC Cadastro_da_Especialidade_Medica  'Ortopedista'
SELECT * FROM Especialidade;
---------------------------------------------------------------------------------------------------------------------------------------------------------



--  Usa o comando CREATE PROCEDURE para criar um usuario com os parametros de  @email e @senha, define o tipo como medico e insere as informacoes ralacionadas ao medico.

CREATE PROCEDURE Cadastro_do_Medico 
@Email VARCHAR(200) , @Senha VARCHAR(200), 
@Nome VARCHAR(200) , @CRM CHAR(7),@ID_Clinica INT, @ID_Especialidade INT 
AS 
BEGIN 
INSERT INTO Usuario(Email,Senha) VALUES(@Email,@Senha);
INSERT INTO Medico(ID_Usuario,Nome,CRM,ID_Clinica,ID_Especialidade) VALUES(SCOPE_IDENTITY(),@Nome,@CRM,@ID_Clinica,@ID_Especialidade);
END


--------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC Cadastro_do_Medico 'junior@gmail.com', 'password', 'Junior' , '111111', '1', '1'
SELECT * FROM Clinica;
SELECT * FROM Especialidade;
SELECT * FROM Medico;
---------------------------------------------------------------------------------------------------------------------------------------------------------



--  Usa o comando CREATE PROCEDURE para criar uma  tabela para consulta médica

CREATE PROCEDURE Cadastro_da_Consulta @ID_Medico INT, @ID_Paciente INT, @Data_da_Consulta DATETIME,@Horario_da_Consulta TIME, @Descricao TEXT, @Feedback  TEXT
AS 
BEGIN 
INSERT INTO Consulta(ID_Medico,ID_Paciente,Data_da_Consulta,Horario_da_Consulta,Descricao,Feedback) VALUES( @ID_Medico, @ID_Paciente, @Data_da_Consulta,@Horario_da_Consulta, @Descricao, @Feedback);
END


--------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC Cadastro_da_Consulta  1, 1,'1994-10-10','14:30:00','Paciente problemacardiaco', 'Otimo atendimento'
SELECT * FROM Clinica;
SELECT * FROM Especialidade;
SELECT * FROM Medico;
SELECT * FROM Consulta;
---------------------------------------------------------------------------------------------------------------------------------------------------------



