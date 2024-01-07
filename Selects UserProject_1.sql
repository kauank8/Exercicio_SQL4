Use EX_USERPROJECT

-- Senha com asteristico
Select id_user, nome, email, usuario, 
Case When(senha='123mudar')
then
'********'
else
senha
end as senha_usuario
from Users

--Projeto 10001
Select nome, descricao, dataProjeto,
DATEADD(DAY,15,dataProjeto) as dataConclusao from Projects
where id_project = 10001

--Usuario do projeto auditoria
Select nome, email from Users
where id_user in(
	Select id_user from users_projects
	where id_project in(
		Select id_project from Projects
		where nome = 'Auditoria'
	)
)

--Projeto Manutenção
Select nome, descricao,dataProjeto, '2014-09-16' as dataConclusao,
DATEDIFF(day,dataProjeto,'2014-09-16') * 79.85 as custo_total
from Projects
where nome Like 'Manutenção%'


