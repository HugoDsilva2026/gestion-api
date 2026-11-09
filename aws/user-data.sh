#!/bin/bash
# User data para la instancia EC2 de gestion-api (Amazon Linux 2023).
# Se pega en Advanced details → User data al crear la instancia.
# Se ejecuta una sola vez, como root, en el primer arranque. Registro: /var/log/cloud-init-output.log
dnf install -y docker git
systemctl enable --now docker
usermod -aG docker ec2-user

# Plugins de Compose y buildx para todos los usuarios.
# El buildx del paquete docker de AL2023 es demasiado antiguo para el Compose actual
# ("compose build requires buildx 0.17.0 or later"): se fija una versión probada.
P=/usr/local/lib/docker/cli-plugins
mkdir -p $P
curl -fSL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o $P/docker-compose
curl -fSL https://github.com/docker/buildx/releases/download/v0.38.1/buildx-v0.38.1.linux-amd64 -o $P/docker-buildx
chmod +x $P/docker-compose $P/docker-buildx
