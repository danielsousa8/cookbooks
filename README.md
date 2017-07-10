ELK com Docker
=============

Essa Stack de ELK foi construída para superar uma necessidade de negócio, e para isso utilizei as ferramentas Elasticsearch na versão 5.5.0 , Kibana 5.5.0 e o Beats 5.5.0

- Elasticsearch - Permite armazenar, pesquisar e analisar grandes volumes de dados rapidamente.
- Kibana - Visualização dos dados.
- Beat - Envia os dados para o Elasticsearch.

#### Provisionamento ####

Nesse projeto estou utilizando o Docker-compose "version 17.06.0-ce" para criaçao e execuçao dos meus serviços em containers.

E para instalaço e configuraço dos pacotes estou utilizando o chef-solo.

#### Infraestrutura ####

Pensando em um ambiente maior para suportar os dados da empresa na AWS, poderiamos utilizar o Elasticsearch service da AWS , em conjuto com o Cloudwatch e o Lambda.
E esse ambiente pode ser construído rapidamente utilizando os módulos do Terraform.

#### Manutenção ####

Cookbooks - As receitas foram construídas pegando informação nos attributes e no json, facilitando a manutenção e a reutilização.

Infraestrutura - No modelo de infraestutura na AWS, a manutenção será feita pelo terraform, pois todo o fluxo foi construído por módulos, toda a infraestrutura como código.

#### Performance ####

O Filebeat é um excelente log shipper , tem uma configuração prática e pouca quantidade de recursos de sistema que consome.
O Elasticsearch faz pesquisa em tempo real, com uma pequena latência (normalmente um segundo) desde o momento em que indexa um documento até o momento em que ele é pesquisado. Também podemos escalar em nível vertical e horizontal, acrescetando nó ou aumentando o instance_type.

#### Segurança ####

Seguindo com a idéia de utilizar a solução acima , o acesso ao  Elasticsearch service será com protocolo HTTPS e com autenticação, podemos incluir o AWS KMS para criptografia.
E restringindo um pouco mais com IAM roles dos serviços, liberando o acesso somente para os recursos necessários.

Obs: O elasticsearch tem a opção de utilizar usuário/senha e o SSL para comunicação com o Filebeat e Kibana. Para isso precisa gerar e configurar o certificado ssl.

#### Custo ####
 
 O Cloudwatch logs tem 10 alarmes e 1 milhão de solicitações de API a cada mês, e 5 GB de ingestão de dados e 5 GB de armazenamento arquivado por mês e 3 painéis de até 50 métricas por mês sem custo adicional.
 
 O Lambda inclui pedidos gratuitos de 1M por mês e 400.000 GB-segundos de tempo de computação por mês. 
 $0.20 por 1 milhão de pedidos depois disso ($0.0000002 por pedido)

 O Elasticsearch service de um modelo t2.medium.elasticsearch por exemplo custa $0.073 por hora.

Obs: Esse é apenas uma visão sobre os benefícios e custo que a AWS oferece.

#### Escalabilidade ####

O ambiente citado acima é facilmente escalavél na AWS, pois o Elasticsearch service nos permite essa flexibilidade para aumentar sua capacidade de execução.

## Iniciando o ELK ##

Primeiro faça o clone do projeto

```
git clone https://github.com/danielsousa8/elk.git
```
Depois execute os seguintes comandos para o build e inicialização do ambiente ...
 
```bash
$ cd elk
$ docker-compose up --build
```
- "--build" cria as imagens antes de iniciar os contêineres.

- "up" exibe a saída de cada container, quando terminar a tarefa o container ficará em stopped.

### Definindo o index ###

Ao Abrir o painel do Kibana , selecione filebeat-* no menu Padrões de índice (lado esquerdo) e, em seguida, clique no botão da estrela  (Definir como índice padrão) para definir o índice Filebeat como padrão.

Obs: Eu já fiz a importação do modelo do index filebeat no momento do provisionamento.

Agora, clique no link Discover na barra de navegação superior. Por padrão, isso irá mostrar todos os dados do registro nos últimos 15 minutos. Você deve ver um histograma com eventos de log, com as mensagens de log.

Click no link para abrir o Kibana;

[http://localhost:5601](http://localhost:5601)

Até logo!!!

Caso precisar, segue o link de instalação do docker compose; 

[https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
