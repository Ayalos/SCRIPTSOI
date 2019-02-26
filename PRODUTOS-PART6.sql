BULK INSERT produtos
FROM 'D:\CSV\06-MIXESCADA.CSV'
WITH
(
 FIRE_TRIGGERS,
 FIRSTROW = 2,
 fieldterminator = ';',
 ROWTERMINATOR = '\n'
)

update ImportadorOI.dbo.Produtos set Custo= replace(custo,'.',''), Custo_Venda=replace(custo_Venda,'.','')
update ImportadorOI.dbo.Produtos set Custo= replace(custo,',','.'), Custo_Venda=replace(custo_Venda,',','.')
update ImportadorOI.dbo.Produtos set Custo= replace(custo,'R$',''), Custo_Venda=replace(custo_Venda,'R$','')
update ImportadorOI.dbo.Produtos set Custo= ltrim(custo), Custo_Venda=ltrim(custo_Venda)

SET IDENTITY_INSERT Lojamix.dbo.produto ON
INSERT INTO Lojamix.dbo.produto(id_produto,nome,situacao,id_entidade_fornecedor,id_marca_produto,id_unidade_medida,id_hierarquia_produto,id_usuario_cadastro,
data_hora_cadastro,id_usuario_alteracao,data_hora_alteracao,tipo_variacao,id_tabela_variacao_a,id_tabela_variacao_b,referencia_interna_produto,preco_custo,
preco_aquisicao,preco_venda,preco_venda_atacado,cod_mercadoria,id_ncm,tributacao_pis_diferenciada,id_situacao_tributaria_pis,aliquota_pis,tributacao_cofins_diferenciada,
id_situacao_tributaria_cofins,aliquota_cofins,id_situacao_tributaria_ipi,aliquota_ipi,origem_produto,tipo_item,descricao_porcao,valor_energetico,valor_energetico_percentual,
quantidade_carboidratos,quantidade_carboidratos_percentual,quantidade_proteinas,quantidade_proteinas_percentual,quantidade_gorduras_totais,quantidade_gorduras_totais_percentual,
quantidade_gorduras_saturadas,quantidade_gorduras_saturadas_percentual,quantidade_gorduras_trans,quantidade_gorduras_trans_percentual,quantidade_fibra_alimentar,
quantidade_fibra_alimentar_percentual,quantidade_sodio,quantidade_sodio_percentual,dias_validade,receita,informacao_adicional,codigo_importacao,mva_interno,
mva_externo,integrar_tablet,cest,id_loja_virtual,perc_red_bc_icms,codigo_anp,largura,altura,comprimento,volume,peso_volume,tipo_dimensao,tipo_peso_volume,id_forca_vendas,
descricao_loja_virtual,indicador_escala,cnpj_fabricante,codigo_beneficio_fiscal,descricao_anp,unidade_tributavel,quantidade_tributavel,percentual_glp,percentual_gnn,percentual_gni,
valor_partida,id_conta,id_nop_venda,natureza_receita_pis,natureza_receita_cofins,enviar_balanca)
select 
distinct produto, 
Descricao,
1,
1,
1,
10,
'1',
1,
cast('18-02-2019 14:30:12.000' as datetime),
NULL, 
NULL,
0,
NULL,
NULL,
'',
cast(Custo as decimal(13,3)),
cast(Custo as decimal(13,3)),
cast(Custo_Venda as decimal(12,2)),
0.00,
NULL,
'8517.62.62',
0,
NULL,
0.00,
0,
NULL,
0.00,
99,
0.00,
0,
1,
'',
0,
0.00,
0.0,
0.00,
0.0,
0.00,
0.0,
0.00,
0.0,
0.00,
0.0,
0.00,
0.0,
0.00,
0.0,
0.00,
0,
'',
'',
NULL,
0.00,
0.00,
1,
NULL,
NULL,
0.00,
'',
0.00000,
0.00000,
0.00000,
0.00000,
0.00000,
1,
1,
0,
'',
NULL,
'',
'',
NULL,
NULL,
0.0000,
0.0000,
0.0000,
0.0000,
0.00,
NULL,
7,
NULL,
NULL,
0 
from ImportadorOI.dbo.Produtos where produto not in(select id_produto from lojamix.dbo.produto)
SET IDENTITY_INSERT LOJAMIX.DBO.PRODUTO OFF