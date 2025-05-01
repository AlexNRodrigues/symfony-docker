## 📝 Descrição do Projeto

Este é um projeto Symfony configurado com Docker, oferecendo um ambiente de desenvolvimento completo com PHP, Nginx e suporte a banco de dados. O projeto utiliza a última versão do Symfony e inclui configurações para Doctrine ORM, Twig template engine e outros bundles essenciais.

## 🚀 Comandos Disponíveis

### Comandos Docker

| Comando | Descrição |
|---------|-----------|
| `make up` | Inicia os containers em background |
| `make down` | Para e remove containers, redes e volumes |
| `make stop` | Para os containers sem remover volumes |
| `make restart` | Reinicia todos os containers |
| `make build` | (Re)constrói as imagens |
| `make ps` | Lista os containers ativos |
| `make logs` | Exibe os logs dos containers |
| `make logs-f` | Exibe os logs dos containers em tempo real |

### Comandos do Symfony/PHP

| Comando | Descrição |
|---------|-----------|
| `make console cmd="comando"` | Executa comandos do Symfony Console |
| `make composer cmd="comando"` | Executa comandos do Composer |
| `make install` | Instala dependências do Composer |
| `make update` | Atualiza dependências do Composer |
| `make cache-clear` | Limpa o cache do Symfony |
| `make bash` | Acessa o shell do container PHP |

### Comandos do Banco de Dados

| Comando | Descrição |
|---------|-----------|
| `make migrate` | Executa as migrations do Doctrine |
| `make schema-update` | Atualiza o schema do banco de dados |
| `make fixtures` | Carrega os fixtures do Doctrine |

### Comandos de Teste

| Comando | Descrição |
|---------|-----------|
| `make test` | Executa os testes com PHPUnit |
| `make coverage` | Executa testes com cobertura de código |

## 🛠️ Estrutura do Projeto

O projeto segue a estrutura padrão do Symfony com algumas personalizações:

- `/app`: Diretório principal da aplicação Symfony
  - `/src`: Código fonte da aplicação
  - `/config`: Arquivos de configuração
  - `/public`: Arquivos públicos e ponto de entrada
  - `/templates`: Templates Twig
  - `/migrations`: Migrações do banco de dados

## 🔧 Configurações Principais

- **Doctrine**: Configurado para suporte a banco de dados com ORM
- **Twig**: Template engine configurado e pronto para uso
- **Routing**: Configurado para usar atributos nos controllers
- **Framework**: Configurações básicas do Symfony Framework

## 💡 Dicas de Uso

1. Use `make up` para iniciar o ambiente de desenvolvimento
2. Execute `make install` para instalar as dependências
3. Use `make migrate` para configurar o banco de dados
4. O ambiente estará disponível em `http://localhost`

## 🔍 Logs e Debugging

- Use `make logs` para verificar os logs do sistema
- Para debugging em tempo real, use `make logs-f`
