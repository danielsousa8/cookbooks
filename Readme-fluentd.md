# Enviando logs do container para o kibana

Para visualizar no kibana o log da app que está em um container no ecs, será preciso acrescentar no seu arquivo Json da task_definition do seu serviço a seguinte config;

## Exemplo:
```
"logConfiguration": {
    "logDriver": "fluentd",
    "options": {
       "fluentd-address": "logs.getninjas.com.br:24224",
       "tag": "web.gaara.homolog"
    }
 },
```
Na tag você precisa adicionar nessa mesma sequência ``` type.app.env ```

Essa config precisa ser adicionada dentro de ```containerDefinitions``` , conforme segue o exemplo abaixo;
## Exemplo:
```
{
  "networkMode": "bridge",
  "taskRoleArn": "arn:aws:iam::590284024382:role/gaara-homolog-role",
  "containerDefinitions": [
    {
      "volumesFrom": [],
      "memory": 768,
      "name": "gaara",
      "image": "getninjas/gaara:${TAG_NAME}",
      "environment": [
      ],
     "logConfiguration": {
         "logDriver": "fluentd",
         "options": {
            "fluentd-address": "logs.getninjas.com.br:24224",
            "tag": "web.gaara.homolog"
         }
      },
      "disableNetworking": false,
      "essential": true,
      "portMappings": [ { "containerPort": 8084 } ]
    }
  ],
  "family": "gaara-homolog"
}
```


Feito isso precisa commitar e fazer o deploy.

## Visualizando seus logs no Kibana

Para visualizar os logs no Kibana, acesse a URL 
[http://kibana.getninjas.com.br/_plugin/kibana](http://kibana.getninjas.com.br/_plugin/kibana)
