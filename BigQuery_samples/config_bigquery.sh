#habilitamos el servicio de bigquery
gcloud services enable bigquery.googleapis.com
#Generamos una variable de ambiente
export PROJECT_ID=$(gcloud config get-value core/project)
#Creamos una cuenta de acceso a bigquery
gcloud iam service-accounts create my-bigquery --display-name "Mi cuenta de servicio bigquery"
#Creamos las credenciales y las guardamos en ~/key.json
gcloud iam service-accounts keys create ~/key.json \
  --iam-account my-bigquery@${PROJECT_ID}.iam.gserviceaccount.com
#Finalmente colocamos las variables en GOOGLE_APPLICATION_CREDENTIALS que serán usadas por 
#la libreria del cliente de Python
export GOOGLE_APPLICATION_CREDENTIALS=~/key.json
#Antes de poder consultar conjuntos de datos de manera publica, asegurate de que 
#la cuenta de servicio tenga al menos el Role roles/bigquery.user función
#ejecute el siguiente comando para asignar la función de usuario a la cuenta de servicio:
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member "serviceAccount:my-bigquery@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role "roles/bigquery.user"
#Puede ejecutar el siguiente comando para verificar que la cuenta de servicio tenga el rol de usuario:
gcloud projects get-iam-policy $PROJECT_ID
#Instalamos las librerías de bigquery para Python 
pip3 install --user --upgrade google-cloud-bigquery
#Creamos un archivo Python
mkdir bigquery-demo
cd bigquery-demo
#Clonamos el repositorio que contiene los ejemplos 
git clone https://github.com/Juanmanuelramirez/bigquery_curso-gcp-udemy.git

