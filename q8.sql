-- Questão 8: Listar título do livro e status de disponibilidade
SELECT l.titulo,
       CASE 
           WHEN e.data_devolucao IS NULL AND e.emprestimo_id IS NOT NULL THEN 'Emprestado'
           ELSE 'Disponível'
       END AS Status
FROM livros l
LEFT JOIN emprestimos e ON l.livro_id = e.livro_id;