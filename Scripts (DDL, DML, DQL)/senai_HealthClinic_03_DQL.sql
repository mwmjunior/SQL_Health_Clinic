
/*  Criar script que exiba os seguintes dados:
- Id Consulta
- Data da Consulta
- Horario da Consulta
- Nome da Clinica
- Nome do Paciente
- Nome do Medico
- Especialidade do Medico
- CRM
- Prontu�rio ou Descricao
- FeedBack(Comentario da consulta)           
*/

-- Usa o comando CREATE VIEW para retorna as  informa��es da consulta
	
CREATE VIEW VisualizarConsultas 
AS
SELECT
    CON.ID_Consulta              AS [ID da Consulta],
    CON.Data_da_Consulta         AS [Data da Consulta],
	CON.Horario_da_Consulta      AS [Hor�rio da Consulta],
    CLI.Nome_Fantasia            AS [Nome da Cl�nica],
    PAC.Nome                     AS [Nome da Paciente],
    MED.Nome                     AS [Nome da M�dico ],
    ESP.Especialidade_Medica     AS [Especialidade],
    MED.CRM ,
    CON.Descricao                AS [Descri��o],
	CON.Feedback

FROM Consulta  CON
INNER JOIN  Medico           MED      ON CON.ID_Medico        = MED.ID_Medico
INNER JOIN  Paciente         PAC      ON CON.ID_Paciente      = PAC.ID_Paciente
INNER JOIN  Clinica          CLI      ON MED.ID_Clinica       = CLI.ID_Clinica
INNER JOIN  Especialidade    ESP      ON MED.ID_Especialidade = ESP.ID_Especialidade;

---------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM VisualizarConsultas;
---------------------------------------------------------------------------------------------------------------------------------------------------------



-- Usa o comando CREATE VIEW para retorna as  informa��es do m�dico

CREATE VIEW ConsultarMedicos 
AS 
SELECT 
MED.ID_Medico AS [ID do M�dico],
MED.Nome AS [Nome do M�dico],
MED.CRM AS [N�mero de Registro do M�dico],
USU.ID_Usuario AS [ID de Usu�rio do M�dico], 
USU.Email AS [Email do M�dico], 
USU.Senha AS [Senha do M�dico],
ESP.ID_Especialidade AS [ID da Especialidade],
ESP.Especialidade_Medica AS [Epecialidade do M�dico],
CLI.ID_Clinica AS [Epecialidade da Cl�nica],
CLI.Nome_Fantasia AS [Nome da Cl�nica],
CLI.Endereco AS [Endere�o da Cl�nica],
CLI.Numero AS [N�mero da Cl�nica], 
CLI.Razao_Social AS [Raz�o social da Cl�nica]

FROM Medico AS MED
LEFT JOIN Usuario			AS USU	ON MED.ID_Usuario		= USU.ID_Usuario
LEFT JOIN Clinica			AS CLI	ON MED.ID_CLINICA		= CLI.ID_Clinica
LEFT JOIN Especialidade		AS ESP	ON MED.ID_ESPECIALIDADE = ESP.ID_Especialidade;


---------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM ConsultarMedicos 
---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Usa o comando CREATE VIEW para retornar as  informa��es do usu�rio

CREATE VIEW ConsultarPacientes
AS
SELECT 
PAC.ID_Paciente AS [ID do Paciente] ,
PAC.Nome AS [Nome do Paciente], 
PAC.CPF AS  [CPF do Paciente], 
PAC.RG AS [RG do Paciente], 
PAC.Telefone AS [Telefone do Paciente], 
PAC.Data_de_Nascimento AS [Data de Nascimento do Paciente],
USU.ID_Usuario AS [ID de Usu�rio do Paciente], 
USU.Email AS [Email do Paciente],
USU.Senha AS [Senha do Paciente]

FROM Paciente AS PAC
LEFT JOIN Usuario			AS USU	ON PAC.ID_Usuario	= USU.ID_Usuario;

---------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM ConsultarPacientes 
---------------------------------------------------------------------------------------------------------------------------------------------------------



-- Usa o comando CREATE VIEW para retorna as  informa��es da consulta

CREATE VIEW ConsultarConsultas
AS
SELECT 
CON.ID_Consulta AS [ID da Consulta],
CON.Data_da_Consulta AS [Data da Consulta],
CON.Descricao AS [Descri��o]


FROM Consulta AS CON
LEFT JOIN ConsultarMedicos		AS MED ON CON.ID_Medico		= MED.[ID do M�dico]
LEFT JOIN ConsultarPacientes    AS PAC ON CON.ID_Paciente	= PAC.[ID do Paciente];

---------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM ConsultarConsultas
---------------------------------------------------------------------------------------------------------------------------------------------------------


-- Usa o comando CREATE VIEW para retorna as  informa��es do usuario

CREATE VIEW ConsultarUsuarios
AS
SELECT USU.ID_Usuario AS [Id do Usuario],
USU.Email AS [Email],
USU.Email AS [Senha]

FROM Usuario AS USU

---------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM ConsultarUsuarios
---------------------------------------------------------------------------------------------------------------------------------------------------------


