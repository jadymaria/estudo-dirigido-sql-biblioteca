-- Questão 1: Selecionar todos os títulos dos livros e seus respectivos anos de publicação.
SELECT titulo, ano_publicacao FROM livros;

-- Questão 2: Quantos livros foram publicados?
SELECT COUNT(*) AS total_livros FROM livros;

-- Questão 3: Média do ano de publicação dos livros para cada editora
SELECT e.nome AS editora, AVG(l.ano_publicacao) AS media_ano
FROM livros l
JOIN editoras e ON l.editora_id = e.editora_id
GROUP BY e.nome;

-- Questão 4: Livro mais antigo e mais recente no acervo
(SELECT titulo, ano_publicacao FROM livros ORDER BY ano_publicacao ASC LIMIT 1)
UNION
(SELECT titulo, ano_publicacao FROM livros ORDER BY ano_publicacao DESC LIMIT 1);

-- Questão 5: Listar todos os livros publicados após o ano 2000
SELECT titulo, ano_publicacao 
FROM livros 
WHERE ano_publicacao > 2000;

-- Questão 6: Selecionar todos os autores em ordem alfabética crescente pelo nome
SELECT * 
FROM autores 
ORDER BY nome ASC;

-- Questão 7: Listar as editoras que publicaram mais de 2 livros
SELECT e.nome AS editora, COUNT(l.livro_id) AS total_livros
FROM editoras e
LEFT JOIN livros l ON e.editora_id = l.editora_id
GROUP BY e.nome
HAVING COUNT(l.livro_id) > 2;

-- Questão 8: Listar título do livro e status de disponibilidade
SELECT l.titulo,
       CASE 
           WHEN e.data_devolucao IS NULL AND e.emprestimo_id IS NOT NULL THEN 'Emprestado'
           ELSE 'Disponível'
       END AS Status
FROM livros l
LEFT JOIN emprestimos e ON l.livro_id = e.livro_id;

-- Questão 9: Título do livro, nome do autor e nome da editora
SELECT l.titulo, a.nome AS autor, ed.nome AS editora
FROM livros l
INNER JOIN autores a ON l.autor_id = a.autor_id
INNER JOIN editoras ed ON l.editora_id = ed.editora_id;

-- Questão 10: Encontrar livros que não possuem um autor cadastrado
SELECT l.titulo
FROM livros l
LEFT JOIN autores a ON l.autor_id = a.autor_id
WHERE l.autor_id IS NULL;