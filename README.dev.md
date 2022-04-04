- Makefile que usaran los desarrolladores para despliegue en local. README con instrucciones para desarrolladores.
  Dentro del Makefile podemos encontrar los siguientes comandos que nos ayudarán con las algunas tareas.

  make upload-file
  Subirá los archivos necesarios al bucket de Dev que en esta ocasión tiene el nombre de  acme-storage-dev-jean-flores.

  make clear-bucket
  Este comando realizará la ejecución el inicio de sesión para verificar que la persona encargada tenga los permisos necesarios, luego se ejecutará un script el cuál verificiará si el bucket tiene un tamaño mayor a 20 Mib, si el bucket tiene un tamaño mayor al mencionado se eliminará todos los datos de este bucket.