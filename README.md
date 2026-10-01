# DevOps — Introdução ao Terraform na AWS

Repositório de estudos do curso de DevOps, focado em Infraestrutura como Código (IaC) com Terraform na AWS.

## 01 — Introdução ao Terraform

O diretório `01-introduction-terraform/` contém o primeiro laboratório: uma configuração básica do Terraform para provisionar recursos na AWS.

### O que o código faz

- **`main.tf`** — Configura o provider da AWS (`hashicorp/aws`, versão `~> 6.0`), com:
  - **Região** definida por variável (`us-east-1` por padrão);
  - **`assume_role`**: em vez de usar credenciais diretas, o Terraform assume uma role IAM (`arn:aws:iam::906401006237:role/awsmanagerrole`) para executar as operações — boa prática de segurança;
  - **`default_tags`**: aplica tags padrão (Environment, Project) automaticamente em todos os recursos criados.

- **`vpc.tf`** — Cria uma VPC (Virtual Private Cloud) com o bloco CIDR `10.1.0.0/16`, que disponibiliza 65.536 endereços IP privados.

- **`variables.tf`** — Define as variáveis `tags` (mapa de tags padrão) e `assume_role` (ARN da role e região).

- **`outputs.tf`** — Reservado para saídas (outputs) da configuração.

### Conceitos praticados

| Conceito | Descrição |
|---|---|
| Provider | Plugin que conecta o Terraform à AWS |
| Resource | Recurso de infraestrutura a ser criado (ex: `aws_vpc`) |
| Variables | Parametrização e reutilização da configuração |
| Assume Role | Autenticação via role IAM, sem chaves hardcoded |
| Default Tags | Padronização de tags para governança e billing |

### Como executar

Pré-requisitos: [Terraform](https://developer.hashicorp.com/terraform/install) instalado e credenciais AWS configuradas com permissão para assumir a role.

```bash
cd 01-introduction-terraform

terraform init      # baixa o provider e inicializa o diretório
terraform plan      # mostra o que será criado
terraform apply     # aplica as mudanças
terraform destroy   # remove os recursos criados
```
