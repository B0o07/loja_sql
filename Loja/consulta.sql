use Loja;

create view ContasNaoPagas as
	select CR.ID as 'ID da Conta a Receber',
		   C.Nome as 'Nome do Cliente',
		   C.CPF as 'CPF do Cliente',
		   CR.DataVencimento as 'Data de Vencimento',
		   CR.Valor as 'Valor da Conta'
	from ContaReceber CR
	join Cliente C on CR.FK_Cliente_ID = C.ID
    where CR.Situacao = '1';
    
select * from ContasNaoPagas;