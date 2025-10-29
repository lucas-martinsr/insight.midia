-- ============================================================
-- Projeto: Insight Mídia - Análise de Desempenho
-- Etapa: 01 - Criação das tabelas
-- Autor: Lucas Martins
-- ============================================================

CREATE DATABASE insightmidia;
USE insightmidia;

CREATE TABLE campanhas (
	id_campanha INT NOT NULL AUTO_INCREMENT, 
	nome_campanha VARCHAR(100) NOT NULL, 
	cliente VARCHAR(50) NOT NULL, 
	orcamento DECIMAL(10,2), 
	data_inicio DATE, 
	data_fim DATE,
PRIMARY KEY (id_campanha));

 CREATE TABLE resultados (
	id_resultado INT NOT NULL AUTO_INCREMENT, 
    id_campanha INT, 
    impressoes INT, 
    cliques INT, 
    conversoes INT, 
    custo_total DECIMAL(10,2),
PRIMARY KEY (id_resultado),
FOREIGN KEY (id_campanha) REFERENCES campanhas(id_campanha));

-- ============================================================
-- Etapa: 02 - Inserção de dados
-- ============================================================

INSERT INTO campanhas (nome_campanha, cliente, orcamento, data_inicio, data_fim)
VALUES
	('Verão Digital', 'Lumina Beauty', 12000.00, '2025-01-05', '2025-02-05'),
	('Black Friday', 'TechNova', 25000.00, '2025-11-01', '2025-11-30'),
	('Novo Lançamento', 'GreenSpark', 18000.00, '2025-03-10', '2025-04-10'),
	('Campanha Institucional', 'Conecta Telecom', 22000.00, '2025-06-01', '2025-06-30'),
    ('Natal com Estilo', 'FitWear', 20000.00, '2025-12-01', '2025-12-31'),
    ('Promoção Relâmpago', 'Casa&Chef', 15000.00, '2025-07-05', '2025-07-20');
    
INSERT INTO resultados (id_campanha, impressoes, cliques, conversoes, custo_total)
VALUES
	(1, 800000, 4200, 310, 10900.00),
    (2, 1500000, 8800, 770, 23900.00),
    (3, 950000, 6100, 520, 16500.00),
    (4, 1200000, 7000, 480, 20500.00),
    (5, 1300000, 7500, 550, 19800.00),
    (6, 600000, 3800, 240, 14200.00);