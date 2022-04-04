- Proyecto terraform para la creación de la unidad de almacenamiento
  Dentro de la ruta terraform se puede encontrar los ficheros para el despliegue de la infraestructura que consiste en un GCS bucket.
  Cada path está asociado a su respectivo ambiente, por ejemplo, todo dentro de terraform/dev será escuchado para el despliegue en el entorno y de igual manera terraform/prod tendrá los archivos para el despliegue en el ambiente de prod.

- Makefile que usaran los desarrolladores para despliegue en local. README con instrucciones para desarrolladores.
  Dentro del Makefile podemos encontrar los siguientes comandos que nos ayudarán con las algunas tareas.

  make dbb(El cuál hace referencia a docker build base)
  Iniciará el build de la imagen base de ser necesario un cambio en la imagen base.

  make dpb(El cuál hace referencia docker push base)
  Iniciará la subida de la imagen base a DockerHub.

  make dbt(Ek cuál hace referencia a docker build terraform)
  Iniciará el build de la imagen terraform con gcp que serán usados por los agentes de jenkins.
 
  make dpt(El cuál hace referencia docker push terraform)
  Iniciará la subida de la imagen terraform con gcp a DockerHub.

  make upload-file
  Subirá los archivos necesarios al bucket de Dev que en esta ocasión tiene el nombre de  acme-storage-dev-jean-flores.

  make clear-bucket
  Este comando realizará la ejecución el inicio de sesión para verificar que la persona encargada tenga los permisos necesarios, luego se ejecutará un script el cuál verificiará si el bucket tiene un tamaño mayor a 20 Mib, si el bucket tiene un tamaño mayor al mencionado se eliminará todos los datos de este bucket.

- Dockerfile del agente que se usará para correr los jobs
  En esta ocasión se manejaron 2 Dockerfiles para el despliegue siendo la imagen jeanflores2c93/base-jenkins-agents usada como base para la imagen jeanflores2c93/terraform-gcp-sdk-agent la cual será finalmente usada como el agente de jenkins.

- Job DSL que correrá Jenkins para crear el job de despliegue
  El job dsl usado generará una carpeta llamada Jobs, además creará 3 pipelines los cuales hacen referencia a 3 archivos Jenkinsfile.
  Jobs/cicd-dev - realizará el despliegue al entorno de dev.
  Jobs/cicd-prod - realizará el despliegue al entorno de prod.
  Jobs/cicd-cron - se ejecutará cada 10 minutos para la validación del tamaño de los buckets y ejecuta un script el cuál validará su tamaño y vaciarlas de ser el caso.

- Jenkinsfile del job de despliegue. El mismo job desplegará en dev y en prod si se cumplen ciertas condiciones
  En este caso usé 2 Jenkinsfile, 1 para el despliegue de dev que solo escuchará los cambios del path terraform/dev y otro que solo escuchará los cambios del path terraform/prod.

- Fichero `yaml` con el pipeline de Github Actions para el despliegue
  Dentro de .github/worflows se encuentran 2 archivos.
  gcs-dev.yaml - el cual se usará para el despliegue de dev.
  gcs-prod.yaml - el cual se usará para el despliegue de prod.

- Job DSL que correrá Jenkins para crear el job de chequeo de almacenamiento
  El cual puede ser encontrado en dsl/jobs.dsl con el nombre de cicd-cron.

- Jenkinsfile del job de chequeo de almacenamiento
  El cual puede ser encontrado como Jenkinsfile.cron.

- README general explicando el proyecto y las decisiones de diseño tomadas. Explicar el porqué de las mismas, sus beneficios y sus inconvenientes
  Decidí generar un pipeline por ambiente puesto que me parece un poco mejor para visualización de las ejecuciones.
  Inconvenientes que se pueden encontrar quizás pueda ser que se tiene que repetir el código.
  Beneficios que encontré con los github actions sobre Jenkinsfile, me pareció un poco más sencillo de configurar que Jenkins.
