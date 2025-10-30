-- ============================================================
-- Projeto: Insight Mídia - Análise de Desempenho
-- Etapa: 03 - Consulta de análise
-- Autor: Lucas Martins
-- ============================================================

USE insightmidia;

-- ============================================================
-- CONSULTA 01 - TOP 5 campanhas por conversão
-- ============================================================

SELECT cam.cliente, cam.nome_campanha, res.conversoes, res.custo_total
FROM campanhas cam
	JOIN resultados res ON cam.id_campanha = res.id_campanha
	ORDER BY res.conversoes DESC
	LIMIT 5;

-- ============================================================
-- CONSULTA 02 - CTR (Click Through Rate)
-- ============================================================

SELECT cam.cliente, cam.nome_campanha, res.cliques, res.impressoes, ROUND (res.cliques / res.impressoes * 100, 2) AS CTR 
FROM campanhas cam
	JOIN resultados res ON cam.id_campanha = res.id_campanha 
	ORDER BY CTR DESC;

-- ============================================================
-- CONSULTA 03 - CPC (Custo por Clique)
-- ============================================================

SELECT cam.cliente, cam.nome_campanha, res.cliques, res.custo_total, ROUND (res.custo_total / res.cliques, 2) AS CPC
FROM campanhas cam
	JOIN resultados res ON cam.id_campanha = res.id_campanha 
	ORDER BY CPC DESC;

-- ============================================================
-- CONSULTA 04 - ROI estimado
-- ============================================================
    
SELECT cam.cliente, cam.nome_campanha, res.conversoes, res.custo_total, ROUND (((res.conversoes *120) - res.custo_total) /res.custo_total * 100 , 0) AS ROI	
FROM campanhas cam
	JOIN resultados res ON cam.id_campanha = res.id_campanha 
    ORDER BY ROI DESC;
    
-- ============================================================
-- CONSULTA 05 - Campanhas com CTR abaixo da média geral
-- ============================================================

SELECT cam.cliente, cam.nome_campanha, ROUND (res.cliques / res.impressoes * 100, 2) AS CTRmedia
FROM campanhas cam
	JOIN resultados res ON cam.id_campanha = res.id_campanha 
	WHERE (res.cliques / res.impressoes * 100) < 
    (SELECT AVG (res.cliques / res.impressoes * 100)
	FROM resultados res);