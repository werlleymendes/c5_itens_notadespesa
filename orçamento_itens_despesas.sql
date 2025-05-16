SELECT c.seqpessoa, c.fantasia fornecedor, b.codproduto, b.descricao, sum(b.quantidade) quantidade, sum(b.vlrtotal - coalesce(b.vlrdesconto, 0)) total
       FROM consinco.Or_Nfdespesa a
       JOIN consinco.or_nfitensdespesa b
            ON a.seqnota = b.seqnota
       JOIN consinco.ge_pessoa c
            ON a.seqpessoa = c.seqpessoa
       JOIN consinco.ge_empresa d
            ON a.nroempresa = d.nroempresa
       WHERE a.seqpessoa || ' ' || c.fantasia = '18781 EXPONENCIAL ENERGIA LTDA' and
             a.dtaentrada between '01-may-2025' and '15-may-2025' and
             d.nomereduzido = '004-FILIAL'
       GROUP BY c.seqpessoa, c.fantasia, b.codproduto, b.descricao;
       
       
       
