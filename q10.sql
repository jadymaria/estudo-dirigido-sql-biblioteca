-- Questão 10: Encontrar livros que não possuem um autor cadastrado
SELECT l.titulo
FROM livros l
LEFT JOIN autores a ON l.autor_id = a.autor_id
WHERE l.autor_id IS NULL;