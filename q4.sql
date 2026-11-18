-- Questão 4: Livro mais antigo e mais recente no acervo
(SELECT titulo, ano_publicacao FROM livros ORDER BY ano_publicacao ASC LIMIT 1)
UNION
(SELECT titulo, ano_publicacao FROM livros ORDER BY ano_publicacao DESC LIMIT 1);