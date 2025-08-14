# Usa una imagen base oficial y ligera de Python.
FROM python:3.11-slim

# Instala la herramienta pipx, que es la forma recomendada de ejecutar apps de Python.
RUN python3 -m pip install --user pipx
RUN python3 -m pipx ensurepath

# Añade la ruta de los ejecutables de pipx al PATH del sistema para que se puedan llamar directamente.
ENV PATH="/root/.local/bin:$PATH"

# Usa pipx para instalar el paquete del servidor MCP de Google Analytics desde GitHub.
RUN pipx install google-analytics-mcp

# Informa a Docker que el contenedor escuchará en el puerto 8000.
# Render usará esta información para dirigir el tráfico.
EXPOSE 8000

# Este es el comando que se ejecutará para iniciar el servidor cuando el contenedor arranque.
CMD ["google-analytics-mcp"]