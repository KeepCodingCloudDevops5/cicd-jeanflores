# Proyecto terraform para la creación de la unidad de almacenamiento <br>
  Dentro de la ruta terraform se puede encontrar los ficheros para el despliegue de la infraestructura que consiste en un GCS bucket.<br>
  Cada path está asociado a su respectivo ambiente, por ejemplo, todo dentro de terraform/dev será escuchado para el despliegue en el entorno y de igual manera terraform/prod tendrá los archivos para el despliegue en el ambiente de prod.<br>

# Makefile que usaran los desarrolladores para despliegue en local. README con instrucciones para desarrolladores.<br>
  Dentro del Makefile podemos encontrar los siguientes comandos que nos ayudarán con las algunas tareas.<br>

  make dbb(El cuál hace referencia a docker build base)<br>
  Iniciará el build de la imagen base de ser necesario un cambio en la imagen base.<br>

  make dpb(El cuál hace referencia docker push base)<br>
  Iniciará la subida de la imagen base a DockerHub.<br>

  make dbt(Ek cuál hace referencia a docker build terraform)<br>
  Iniciará el build de la imagen terraform con gcp que serán usados por los agentes de jenkins.<br>
 
  make dpt(El cuál hace referencia docker push terraform)<br>
  Iniciará la subida de la imagen terraform con gcp a DockerHub.<br>

  make upload-file<br>
  Subirá los archivos necesarios al bucket de Dev que en esta ocasión tiene el nombre de  acme-storage-dev-jean-flores.<br>

  make clear-bucket<br>
  Este comando realizará la ejecución el inicio de sesión para verificar que la persona encargada tenga los permisos necesarios, luego se ejecutará un script el cuál verificiará si el bucket tiene un tamaño mayor a 20 Mib, si el bucket tiene un tamaño mayor al mencionado se eliminará todos los datos de este bucket.<br>

# Dockerfile del agente que se usará para correr los jobs<br>
  En esta ocasión se manejaron 2 Dockerfiles para el despliegue siendo la imagen jeanflores2c93/base-jenkins-agents usada como base para la imagen jeanflores2c93/terraform-gcp-sdk-agent la cual será finalmente usada como el agente de jenkins.<br>

# Job DSL que correrá Jenkins para crear el job de despliegue<br>
  El job dsl usado generará una carpeta llamada Jobs, además creará 3 pipelines los cuales hacen referencia a 3 archivos Jenkinsfile.<br>
  Jobs/cicd-dev - realizará el despliegue al entorno de dev.<br>
  Jobs/cicd-prod - realizará el despliegue al entorno de prod.<br>
  Jobs/cicd-cron - se ejecutará cada 10 minutos para la validación del tamaño de los buckets y ejecuta un script el cuál validará su tamaño y vaciarlas de ser el caso.<br>

# Jenkinsfile del job de despliegue. El mismo job desplegará en dev y en prod si se cumplen ciertas condiciones<br>
  En este caso usé 2 Jenkinsfile, 1 para el despliegue de dev que solo escuchará los cambios del path terraform/dev y otro que solo escuchará los cambios del path terraform/prod.<br>

# Fichero `yaml` con el pipeline de Github Actions para el despliegue<br>
  Dentro de .github/worflows se encuentran 2 archivos.<br>
  gcs-dev.yaml - el cual se usará para el despliegue de dev.<br>
  gcs-prod.yaml - el cual se usará para el despliegue de prod.<br>

# Job DSL que correrá Jenkins para crear el job de chequeo de almacenamiento<br>
  El cual puede ser encontrado en dsl/jobs.dsl con el nombre de cicd-cron.<br>

# Jenkinsfile del job de chequeo de almacenamiento<br>
  El cual puede ser encontrado como Jenkinsfile.cron.<br>

# README general explicando el proyecto y las decisiones de diseño tomadas. Explicar el porqué de las mismas, sus beneficios y sus inconvenientes<br>
  Decidí generar un pipeline por ambiente puesto que me parece un poco mejor para visualización de las ejecuciones.<br>
  Inconvenientes que se pueden encontrar quizás pueda ser que se tiene que repetir el código.<br>
  Beneficios que encontré con los github actions sobre Jenkinsfile, me pareció un poco más sencillo de configurar que Jenkins.<br>


Algunas imágenes:<br>

1. GCS Buckets usados para este proyecto.<br>
  1.a) acme-storage-dev-jean-flores(Bucket usado para el entorno de dev)<br>
  1.b) acme-storage-prod-jean-flores(Bucket usado para el entorno de prod)<br>
  1.c) backend-dev-jean-flores(Bucket usado para el state de terraform en el entorno de dev)<br>
  1.d) backend-prod-jean-flores(Bucket usado para el state de terraform en el entorno de prod)<br>
  ![GCS Buckets](/images/gcs-buckets.png)

2. Service accounts generadas.<br>
  ![Service accounts](/images/sa.png)


3. Github secrets.<br>
  Secrets usados como el service account y el correo de la service account.<br>
  ![Github secrets](/images/github-secrets.png)

4. Github actions.<br>
  Pruebas de los github actions.<br>
  ![Github actions](/images/github-actions.png)

5. Jenkins Cloud.<br>
  Configuración de jenkins cloud para el manejo de nodos.<br>
  ![Jenkins cloud](/images/jenkins-cloud.png)

6. Jenkins Cron job.<br>
  Pipeline de Jenkins cron.<br>
  ![Jenkins Cron job](/images/jenkins-cron.png)

7. Jenkins DEV job.<br>
  Pipeline para la ejecución del entorno de dev.<br>
  ![Jenkins DEV job](/images/jenkins-dev.png)

8. Jenkins PROD job.<br>
  Pipeline para la ejecución del entorno de prod.<br>
  ![Jenkins PROD job](/images/jenkins-prod.png)

9. Jenkins Webhook configurado para recibir los push events.<br>
  Webhook.<br>
  ![Jenkins Webhook](/images/jenkins-webhook.png)
