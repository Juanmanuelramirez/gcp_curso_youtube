# Utilizamos una imagen de oficial de python ligera.
# https://hub.docker.com/_/python
FROM python:3.7-slim
# Instalamos las dependencias en producción.
RUN pip install Flask gunicorn
# Copiamos el código local a la imágen contenedor.
WORKDIR /app
COPY . .
# El servicio escucha a $PORT variable de entorno.
# Este valor local predeterminado facilita el despliegue.
ENV PORT 8080
# Ejecutamos el servicio al ejecutar el contenedor. Aquí utilizamos gunicorn
# Servicio web, con un proceso de trabajo y 8 hilos.
# Para ambientes con múltiples núcleos, incrementa el número de procesos.
# hasta ser igual al número de núcleos disponibles.
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 app:app