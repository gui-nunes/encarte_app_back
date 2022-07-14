-- CreateTable
CREATE TABLE "usuario" (
    "uid" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "responsavel" BOOLEAN NOT NULL DEFAULT true,
    "criado_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME
);

-- CreateTable
CREATE TABLE "empresa" (
    "uid" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "uid_responsavel" TEXT NOT NULL,
    "criado_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME,
    CONSTRAINT "empresa_uid_responsavel_fkey" FOREIGN KEY ("uid_responsavel") REFERENCES "usuario" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "empresa_produto" (
    "uid_produto" TEXT NOT NULL,
    "uid_empresa" TEXT NOT NULL,

    PRIMARY KEY ("uid_empresa", "uid_produto"),
    CONSTRAINT "empresa_produto_uid_empresa_fkey" FOREIGN KEY ("uid_empresa") REFERENCES "empresa" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "empresa_produto_uid_produto_fkey" FOREIGN KEY ("uid_produto") REFERENCES "produto" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "produto" (
    "uid" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "marca" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "imagem" TEXT NOT NULL,
    "criado_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" DATETIME
);

-- CreateTable
CREATE TABLE "produto_promocao" (
    "uid_produto" TEXT NOT NULL,
    "uid_promocao" TEXT NOT NULL,

    PRIMARY KEY ("uid_produto", "uid_promocao"),
    CONSTRAINT "produto_promocao_uid_produto_fkey" FOREIGN KEY ("uid_produto") REFERENCES "produto" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "produto_promocao_uid_promocao_fkey" FOREIGN KEY ("uid_promocao") REFERENCES "promocao" ("uid") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "promocao" (
    "uid" TEXT NOT NULL PRIMARY KEY,
    "titulo" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "disponivel" BOOLEAN NOT NULL DEFAULT true,
    "criado_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "valido_ate" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "usuario_uid_key" ON "usuario"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_cpf_key" ON "usuario"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_email_key" ON "usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "empresa_uid_key" ON "empresa"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "empresa_cnpj_key" ON "empresa"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "empresa_uid_responsavel_key" ON "empresa"("uid_responsavel");

-- CreateIndex
CREATE UNIQUE INDEX "produto_uid_key" ON "produto"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "promocao_uid_key" ON "promocao"("uid");
