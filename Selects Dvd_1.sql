Use LocacaoDVD

--Filme cujos dvd foram fabricados depois de 01/01/2020
Select id_filme, ano,
Case When (LEN(titulo)>10) Then
SUBSTRING(titulo,1,10) + '...' 
else
titulo
end as nome_filme
from Filme
Where id_filme in(
Select id_filme from Dvd
where dataFabricacao > '2020-01-01'
)

--Consulta interestelar
Select num_dvd, dataFabricacao,
DATEDIFF(Month,dataFabricacao,GETDATE()) as qtd_meses_desde_fabricacao
from Dvd
where id_filme = 1003

-- Consulta locacao
Select Distinct num_dvd, data_locacao,data_devolucao,
DATEDIFF(Day,data_locacao,data_devolucao) as dias_alugado, valor
from Locacao
Where num_cliente in(
Select Distinct num_cadastro from Cliente
where nome Like '%Rosa%'
)

--Consulta dos clientes
Select nome,
logradouro + ' Num:' + Cast(num as varchar(10)) as end_completo,
SUBSTRING(cep,1,5) + '-' + SUBSTRING(cep,6,8) as cep
from Cliente
where num_cadastro in(
	Select num_cliente from Locacao
	where num_dvd = 10002
)
