-- Questão 9: Título do livro, nome do autor e nome da editora
SELECT l.titulo, a.nome AS autor, ed.nome AS editora
FROM livros l
INNER JOIN autores a ON l.autor_id = a.autor_id
INNER JOIN editoras ed ON l.editora_id = ed.editora_id;