-- Questão 5: Listar todos os livros publicados após o ano 2000
SELECT titulo, ano_publicacao 
FROM livros 
WHERE ano_publicacao > 2000;