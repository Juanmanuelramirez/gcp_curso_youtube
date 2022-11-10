# Habilita las API requeridas
gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com \
    containeranalysis.googleapis.com

# Crea un clúster de GKE que usarás para implementar 
# la aplicación en este ejercicio
gcloud container clusters create hello-cloudbuild \
    --num-nodes 1 --zone us-central1-b

# Si nunca usaste Git en Cloud Shell, 
# configúralo con tu nombre y dirección de correo electrónico
git config --global user.email "juanmrs30cm@gmail.com"
git config --global user.name "juan"

# Conecta la cuenta de usuario de GCP con Cloud Source Repositories
git config credential.helper gcloud.sh

# En Cloud Shell, crea los dos repositorios de Git
gcloud source repos create hello-cloudbuild-app
gcloud source repos create hello-cloudbuild-env

# Clona el código de ejemplo desde GitHub
cd ~
git clone https://github.com/GoogleCloudPlatform/gke-gitops-tutorial-cloudbuild \
    hello-cloudbuild-app

# Configura Cloud Source Repositories como remoto
cd ~/hello-cloudbuild-app
PROJECT_ID=$(gcloud config get-value project)
git remote add google \
    "https://source.developers.google.com/p/${PROJECT_ID}/r/hello-cloudbuild-app"


# Crea una compilación de Cloud Build basada en la última confirmación
cd ~/hello-cloudbuild-app
COMMIT_ID="$(git rev-parse --short=7 HEAD)"
gcloud builds submit --tag="gcr.io/${PROJECT_ID}/hello-cloudbuild:${COMMIT_ID}" .