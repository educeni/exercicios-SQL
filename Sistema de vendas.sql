-- create
CREATE TABLE cliente (
 id_cliente INTEGER not null PRIMARY KEY auto_increment,
 nome varchar(100) NOT NULL
);


CREATE TABLE produto (
 id_produto INTEGER not null PRIMARY KEY auto_increment,
 nome varchar(100) NOT NULL,
 preco decimal(10,2) NOT NULL
);


CREATE TABLE pedido (
 id_pedido INTEGER not null PRIMARY KEY auto_increment,
 id_cliente int not null,
 foreign KEY (id_cliente) references cliente(id_cliente),
 data_pedido date
);


CREATE TABLE item_pedido (
 id_item INTEGER not null PRIMARY KEY auto_increment,
 id_pedido int,
 foreign key (id_pedido) references pedido(id_pedido),
 id_produto int,
 foreign key(id_produto) references produto(id_produto),
 quantidade int default 0
);


CREATE TABLE auditoria_pedido (
 id_auditoria INTEGER not null PRIMARY KEY auto_increment,
 id_pedido int,
 foreign key (id_pedido) references pedido(id_pedido),
 acao varchar(100) NOT NULL,
 data_modificacao date
);


-- insert
INSERT INTO cliente (nome) VALUES
('João Silva'),
('Maria Santos'),
('Pedro Oliveira'),
('Ana Costa'),
('Lucas Souza');


INSERT INTO produto (nome, preco) VALUES
('Notebook', 3500.00),
('Mouse', 80.00),
('Teclado', 150.00),
('Monitor', 1200.00),
('Headset', 250.00);


INSERT INTO pedido (id_cliente, data_pedido) VALUES
(1, '2026-11-01'),
(2, '2026-11-02'),
(3, '2026-11-03'),
(4, '2026-11-04'),
(5, '2026-11-05');


INSERT INTO item_pedido
(id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 4, 1),
(2, 5, 1),
(3, 3, 2),
(3, 2, 1),
(4, 1, 1),
(4, 3, 1),
(5, 5, 2),
(5, 2, 3);


INSERT INTO auditoria_pedido
(id_pedido, acao, data_modificacao) VALUES
(1, 'Pedido criado', '2026-11-01'),
(1, 'Pedido atualizado', '2026-11-01'),
(2, 'Pedido criado', '2026-11-02'),
(3, 'Pedido criado', '2026-11-03'),
(4, 'Pedido enviado', '2026-11-04'),
(5, 'Pedido criado', '2026-11-05');


DELIMITER //


CREATE PROCEDURE InserirPedido (
   IN p_id_cliente INT,    IN p_data_pedido DATE,
   IN p_id_produto1 INT,
   IN p_qtd1 INT,
   IN p_id_produto2 INT,
   IN p_qtd2 INT
)
BEGIN
   DECLARE novo_pedido_id INT;


   -- Inserir pedido
   INSERT INTO PEDIDO (id_cliente, data_pedido)
   VALUES (p_id_cliente, p_data_pedido);


   SET novo_pedido_id = LAST_INSERT_ID();


   -- Inserir itens
   INSERT INTO ITEM_PEDIDO (id_pedido, id_produto, quantidade)
   VALUES (novo_pedido_id, p_id_produto1, p_qtd1),
          (novo_pedido_id, p_id_produto2, p_qtd2);
END //


DELIMITER ;


DELIMITER //


CREATE FUNCTION CalcularTotalPedido(pedido_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
   DECLARE total DECIMAL(10,2);


   SELECT SUM(p.preco * ip.quantidade)
   INTO total
   FROM ITEM_PEDIDO ip
   JOIN PRODUTO p ON ip.id_produto = p.id_produto
   WHERE ip.id_pedido = pedido_id;


   RETURN IFNULL(total, 0);
END //


DELIMITER ;


DELIMITER //


CREATE TRIGGER trg_auditoria_pedido
AFTER UPDATE ON PEDIDO
FOR EACH ROW
BEGIN
   INSERT INTO AUDITORIA_PEDIDO (id_pedido, acao)
   VALUES (NEW.id_pedido, 'UPDATE');
END //


DELIMITER ;


SHOW TABLES;
DESCRIBE cliente;
SELECT * FROM cliente;


-- Liste os pedidos, considerando
-- a soma do valor dos produtos multiplicado pela quantidade em todos os pedidos.
-- Nome do cliente
-- Total comprado (como total_gasto)
-- Quantidade total de itens comprados
-- Ordene do maior para o menor valor


SELECT c.nome, pr.preco, i.quantidade, (preco * quantidade) as total_vendas from item_pedido i
inner join pedido p on p.id_pedido = i.id_pedido
inner join produto pr on pr.id_produto = i.id_pedido
inner join cliente c on c.id_cliente = p.id_cliente
order by total_vendas desc;


select * from pedido where data_pedido >= DATE_SUB(NOW(), INTERVAL 30 DAY);


-- Liste todos os produtos que já foram incluídos em algum pedido.
-- Para cada produto, exiba:
-- Nome do produto
-- Quantidade total vendida
-- Categoria fictícia:
-- e a soma da quantidade for maior que 50
-- se entre 10 e 50
-- se menos que 10


select pr.*, sum(i.quantidade) as quantidade_total,
CASE
 when sum(i.quantidade) > 50 then 'Excesso de estoque'
 when sum(i.quantidade) > 10 and sum(i.quantidade) < 50 then 'Estoque ideal'
 else 'Falta de estoque'
end as QuantidadeTotal
from item_pedido i
inner join produto pr
on pr.id_produto = i.id_produto
GROUP BY pr.id_produto, pr.nome;



