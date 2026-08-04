-- TABELA EDITORA
create table editora (
	ideditora serial not null,
	nome varchar(50) not null,

	constraint pk_edt_ideditora primary key (ideditora),
	constraint un_edt_nome unique (nome)
)

insert into editora (nome) values ('Bookman');
insert into editora (nome) values ('Edgard Blusher');
insert into editora (nome) values ('Nova Terra');
insert into editora (nome) values ('Brasport');
select * from editora

-- TABELA CATEGORIA
create table categoria (
	idcategoria serial not null,
	nome varchar(50),

	constraint pk_cat_idcategoria primary key (idcategoria),
	constraint un_cat_nome unique (nome)
)
insert into categoria (nome) values ('Banco de Dados');
insert into categoria (nome) values ('HTML');
insert into categoria (nome) values ('Java');
insert into categoria (nome) values ('PHP');
select * from categoria

-- TABELA AUTOR
create table autor (
	idautor serial not null,
	nome varchar(50),

	constraint pk_aut_idautor primary key (idautor),
	constraint un_aut_nome unique (nome)
);

insert into autor (nome) values ('Waldemar Setzer');
insert into autor (nome) values ('Flávio Soares');
insert into autor (nome) values ('John Watson');
insert into autor (nome) values ('Rui Rossi dos Santos');
insert into autor (nome) values ('Antonio Pereira Resende');
insert into autor (nome) values ('Claudiney Calixto Lima');
insert into autor (nome) values ('Evandro Carlos Teruel');
insert into autor (nome) values ('Ian Graham');
insert into autor (nome) values ('Fabrício Xavier');
insert into autor (nome) values ('Pablo Dalloglio');
select * from autor

-- TABELA LIVRO
create table livro (
	idlivro serial not null,
	ideditora integer not null,
	idcategoria integer not null,
	nome varchar(500) not null,

	constraint pk_liv_idlivro primary key (idlivro),
	constraint fk_edt_ideditora foreign key (ideditora) references editora (ideditora),
	constraint fk_cat_idcategoria foreign key (idcategoria) references categoria (idcategoria),
	constraint un_liv_nome unique (nome)
)
select * from livro
insert into livro (ideditora, idcategoria, nome) values (2,1,'Banco de Dados - 1 Edição');
insert into livro (ideditora, idcategoria, nome) values (1,1,'Oracle DataBase 11G Administração');
insert into livro (ideditora, idcategoria, nome) values (3,3,'Programação de Computadores em Java');
insert into livro (ideditora, idcategoria, nome) values (4,3,'Programação Orientada a Aspectos em Java');
insert into livro (ideditora, idcategoria, nome) values (4,2,'HTML5 - Guia Prático');
insert into livro (ideditora, idcategoria, nome) values (3,2,'XHTML - Guia de Referência para Desenvlvimento na Web');
insert into livro (ideditora, idcategoria, nome) values (1,4,'PHP para Desenvolvimento Profissional');
insert into livro (ideditora, idcategoria, nome) values (2,4,'PHP com Prograação Orientada a Objetos');

-- TABELA LIVRO_AUTOR
create table livro_autor (
	idlivro integer not null,
	idautor integer not null,

	constraint pk_lva_idlicroautor primary key (idlivro, idautor),
	constraint fk_lva_idlivro foreign key (idlivro) references livro (idlivro),
	constraint fk_lva_idautor foreign key (idautor) references autor (idautor)
)
select * from livro_autor
insert into livro_autor values (1,1);
insert into livro_autor values (1,2);
insert into livro_autor values (2,3);
insert into livro_autor values (3,4);
insert into livro_autor values (4,5);
insert into livro_autor values (4,6);
insert into livro_autor values (5,7);
insert into livro_autor values (6,8);
insert into livro_autor values (7,9);
insert into livro_autor values (8,10);


-- TABELA ALUNO
create table aluno  (
	idaluno serial not null,
	nome varchar(70) not null,

	constraint pk_alu_idaluno primary key (idaluno),
	constraint un_alu_nome unique (nome)
)
insert into aluno (nome) values ('Mario');
insert into aluno (nome) values ('João');
insert into aluno (nome) values ('Paulo');
insert into aluno (nome) values ('Pedro');
insert into aluno (nome) values ('Maria');
select * from aluno

-- TABELA EMPRESTIMO
create table emprestimo (
	idemprestimo serial not null,
	idaluno integer not null,
	data_emprestimo date default current_date,
	data_devolucao  date not null,
	valor numeric(5,2) not null,
	devolvido varchar(1) not null,

	constraint pk_emp_idemprestimo primary key (idemprestimo),
	constraint fk_alu_idaluno foreign key (idaluno) references aluno (idaluno)
)
insert into emprestimo (idaluno, data_emprestimo, data_devolucao, valor, devolvido) values (1,'2012-05-02', '2012-05-12', 10, 'S');
insert into emprestimo (idaluno, data_emprestimo, data_devolucao, valor, devolvido) values (1,'2012-04-23','2012-05-03', 5, 'N');
insert into emprestimo (idaluno, data_emprestimo, data_devolucao, valor, devolvido) values (2,'2012-05-10','2012-05-20', 12, 'N');
insert into emprestimo (idaluno, data_emprestimo, data_devolucao, valor, devolvido) values (3,'2012-05-10','2012-05-20', 8, 'S');
insert into emprestimo (idaluno, data_emprestimo, data_devolucao, valor, devolvido) values (4,'2012-05-05','2012-05-15', 15, 'N');
insert into emprestimo (idaluno, data_emprestimo, data_devolucao, valor, devolvido) values (4,'2012-05-07','2012-05-17', 20, 'S');
insert into emprestimo (idaluno, data_emprestimo, data_devolucao, valor, devolvido) values (4,'2012-05-08','2012-05-18', 5, 'S');
select * from emprestimo

-- TABELA EMPRESTIMO_LIVRO
create table emprestimo_livro (
	idemprestimo integer not null,
	idlivro integer not null,

	constraint pk_eml_idemprestimo_livro primary key (idemprestimo, idlivro),
	constraint fk_emp_idemprestimo foreign key (idemprestimo) references emprestimo (idemprestimo),
	constraint fk_liv_idlivro foreign key (idlivro) references livro (idlivro)
)
insert into emprestimo_livro (idemprestimo, idlivro) values (1,1);
insert into emprestimo_livro (idemprestimo, idlivro) values (2,4);
insert into emprestimo_livro (idemprestimo, idlivro) values (2,3);
insert into emprestimo_livro (idemprestimo, idlivro) values (3,2);
insert into emprestimo_livro (idemprestimo, idlivro) values (3,7);
insert into emprestimo_livro (idemprestimo, idlivro) values (4,5);
insert into emprestimo_livro (idemprestimo, idlivro) values (5,4);
insert into emprestimo_livro (idemprestimo, idlivro) values (6,6);
insert into emprestimo_livro (idemprestimo, idlivro) values (6,1);
insert into emprestimo_livro (idemprestimo, idlivro) values (7,8);
select * from emprestimo_livro

-- INDICES
create index idx_emp_idemprestimo on emprestimo (idemprestimo);
create index idx_emp_data_devolucao on emprestimo (data_devolucao)

-- CONSULTAS COM JOIN

-- O nome do livro, a categoria e a editora (LIVRO) – fazer uma view 
create view dados_livro as
select 
	lvr.nome as livro,
	ctg.nome as categoria,
	edt.nome as editora
from 
	livro lvr
left outer join 
	categoria ctg on lvr.idcategoria = ctg.idcategoria
left outer join
	editora edt on lvr.ideditora = edt.ideditora

select * from dados_livro

-- O nome do livro e o nome do autor (LIVRO_AUTOR) – fazer uma view. 
create view livro_autor_view as
select 
	lvr.nome as livro,
	atr.nome as autor
from
	livro_autor lva
left outer join
	livro lvr on lva.idlivro = lvr.idlivro
left outer join
	autor atr on lva.idautor = atr.idautor
select * from livro_autor_view

-- O nome do aluno, a data do empréstimo e a data de devolução (EMPRESTIMO). 
select 
	aln.nome as aluno,
	emp.data_emprestimo,
	emp.data_devolucao
from emprestimo emp
left outer join 
	aluno aln on emp.idaluno = aln.idaluno

-- O nome de todos os livros que foram emprestados (EMPRESTIMO_LIVRO). 
select
	distinct (lvr.nome) as livro
from emprestimo_livro elv
left outer join 
	livro lvr on elv.idlivro = lvr.idlivro