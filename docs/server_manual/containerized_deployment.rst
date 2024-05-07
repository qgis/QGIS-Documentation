************************
Containerized deployment
************************

.. only:: html

   .. contents::
      :local:
      :depth: 3

There are many ways to use containerized application, from the most
simple (simple Docker images) to sophisticated (Kubernetes and so on).

.. note:: This kind of deployment needs the
   `docker application <https://www.docker.com>`_ to be installed and
   running.
   Check this `tutorial <https://www.docker.com/101-tutorial>`_.

.. Hint:: Docker run pre packaged application (aka images)
   which can be retrieved as sources (Dockerfile and resources) to
   build or already built from registries (private or public).

.. note:: QGIS Debian-Ubuntu package downloads need a valid gpg authentication key.  
   Please refer to the `installation pages <https://www.qgis.org/fr/site/forusers/alldownloads.html#debian-ubuntu>`_ 
   to update the following Dockerfile.

.. _simple-docker-images:

Simple docker images
====================

As the docker image does not exist in a public registry. you will need to build
it. To do so create a directory :file:`qgis-server` and within its directory:

* create a file :file:`Dockerfile` with this content:

.. code-block:: dockerfile

  FROM debian:bookworm-slim
  
  ENV LANG=en_EN.UTF-8
  
  
  RUN apt-get update \
      && apt-get install --no-install-recommends --no-install-suggests --allow-unauthenticated -y \
          gnupg \
          ca-certificates \
          wget \
          locales \
      && localedef -i en_US -f UTF-8 en_US.UTF-8 \
      # Add the current key for package downloading
      # Please refer to QGIS install documentation (https://www.qgis.org/fr/site/forusers/alldownloads.html#debian-ubuntu)
      && mkdir -m755 -p /etc/apt/keyrings \
      && wget -O /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg \
      # Add repository for latest version of qgis-server
      # Please refer to QGIS repositories documentation if you want other version (https://qgis.org/en/site/forusers/alldownloads.html#repositories)
      && echo "deb [signed-by=/etc/apt/keyrings/qgis-archive-keyring.gpg] https://qgis.org/debian bookworm main" | tee /etc/apt/sources.list.d/qgis.list \
      && apt-get update \
      && apt-get install --no-install-recommends --no-install-suggests --allow-unauthenticated -y \
          qgis-server \
          spawn-fcgi \
          xauth \
          xvfb \
      && apt-get remove --purge -y \
          gnupg \
          wget \
      && rm -rf /var/lib/apt/lists/*
  
  RUN useradd -m qgis
  
  ENV TINI_VERSION v0.19.0
  ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
  RUN chmod +x /tini
  
  ENV QGIS_PREFIX_PATH /usr
  ENV QGIS_SERVER_LOG_STDERR 1
  ENV QGIS_SERVER_LOG_LEVEL 2
  
  COPY cmd.sh /home/qgis/cmd.sh
  RUN chmod -R 777 /home/qgis/cmd.sh
  RUN chown qgis:qgis /home/qgis/cmd.sh
  
  USER qgis
  WORKDIR /home/qgis
  
  ENTRYPOINT ["/tini", "--"]
  
  CMD ["/home/qgis/cmd.sh"]

* create a file :file:`cmd.sh` with this content:

.. code-block:: bash

  #!/bin/bash
  
  [[ $DEBUG == "1" ]] && env
  
  exec /usr/bin/xvfb-run --auto-servernum --server-num=1 /usr/bin/spawn-fcgi -p 5555 -n -d /home/qgis -- /usr/lib/cgi-bin/qgis_mapserv.fcgi


* build the image with:

.. code-block:: bash

  docker build -f Dockerfile -t qgis-server ./


First run
---------

To run the server you will need a QGIS project file. You can use one of yours or pick
`this sample <https://gitlab.com/Oslandia/qgis/docker-qgis/-/blob/cc1798074d4a66a472721352f3984bb318777a5a/qgis-exec/data/osm.qgs>`_.

To do so, create a directory :file:`data` within the directory
:file:`qgis-server` and copy your file in it. To comply with the following
explanations, rename it to :file:`osm.qgs`.

.. note::

  You may need to add advertised URLs under the :guilabel:`QGIS Server` tab of the
  :menuselection:`Project --> Properties` if the GetCapabilites are broken.
  For example if your server is exposed on port 8080, you will put this for
  advertised URL ``http://localhost:8080/qgis-server/``. More information
  available in section :ref:`Creatingwmsfromproject` and subsequent.


Now, you can run the server with:

.. code-block:: bash

  docker network create qgis
  docker run -d --rm --name qgis-server --net=qgis --hostname=qgis-server \
                -v $(pwd)/data:/data:ro -p 5555:5555 \
                -e "QGIS_PROJECT_FILE=/data/osm.qgs" \
                qgis-server

Options used:

- **-d**: run in the background
- **--rm**: remove the container when it is stopped
- **--name**: name of the container to be created
- **--net**: (previously created) sub network
- **--hostname**: container hostname, for later referencing
- **-v**: local data directory to be mounted in the container
- **-p**: host/container port mapping
- **-e**: environment variable to be used in the container
          

To check, type ``docker ps | grep qgis-server`` and you should see a
line with **qgis-server**::

  CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS         PORTS                    NAMES
  4de8192da76e   qgis-server   "/tini -- /home/qgis…"   3 seconds ago   Up 2 seconds   0.0.0.0:5555->5555/tcp   qgis-server


Usable sample
-------------

As the server is only accepting fastcgi connections, you need
an HTTP server that handles this protocol.
To do so we have to create a simple Nginx configuration file and start
a Nginx image.

Create a file :file:`nginx.conf` in the current directory with this
content:

.. code-block:: nginx

  server {
    listen 80;
    server_name _;
    location / {
      root  /usr/share/nginx/html;
      index index.html index.htm;
    }
    location /qgis-server {
      proxy_buffers 16 16k;
      proxy_buffer_size 16k;
      gzip off;
      include fastcgi_params;
      fastcgi_pass qgis-server:5555;
    }
  }

And type this command:

.. code-block:: bash

  docker run -d --rm --name nginx --net=qgis --hostname=nginx \
                -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf:ro -p 8080:80 \
                nginx:1.13

To check capabilities availability, type in a browser
http://localhost:8080/qgis-server/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities

Cleanup
-------

To cleanup the running images, type:

.. code-block:: bash

  docker stop qgis-server nginx

.. _docker-stacks:

Docker stacks
=============

The previous method is scriptable, but not easily packageable nor
standardized or easily manageable.

To work with a docker image set you could use a docker stack managed
by an orchestrator.
In a stack, the images are working in the same private network, and
you can start / stop the whole stack or deploy the stack to other
workers.
There are many orchestrators, for example Swarm, Kubernetes and Mesos.

In the following, we will present simple configurations for testing
purposes.
They are not suitable for production.

Swarm/docker-compose
--------------------

Docker now has its own orchestrator: Swarm (compatible with docker-compose
files). You have to
`enable it <https://docs.docker.com/get-started/orchestration/#enable-docker-swarm>`_
(the Mac version will also work with Linux).

.. _docker-compose-file:

Stack description
^^^^^^^^^^^^^^^^^

Now that you have Swarm working, create the service file (see
`Deploy to Swarm <https://docs.docker.com/get-started/swarm-deploy/>`_)
:file:`qgis-stack.yaml`:

.. code-block:: yaml
    
  version: '3.7'
  
  services:
    qgis-server:
      # Should use version with utf-8 locale support:
      image: qgis-server:latest
      volumes:
        - REPLACE_WITH_FULL_PATH/data:/data:ro
      environment:
        - LANG=en_EN.UTF-8
        - QGIS_PROJECT_FILE=/data/osm.qgs
        - QGIS_SERVER_LOG_LEVEL=0  # INFO (log all requests)
        - DEBUG=1                  # display env before spawning QGIS Server
  
    nginx:
      image: nginx:1.13
      ports:
        - 8080:80
      volumes:
        - REPLACE_WITH_FULL_PATH/nginx.conf:/etc/nginx/conf.d/default.conf:ro
      depends_on:
        - qgis-server
  

To deploy (or update) the stack, type:

.. code-block:: bash

  docker stack deploy -c qgis-stack.yaml qgis-stack

Check the stack deployment status until you obtain **1/1** in the
**replicas** column:

.. code-block:: bash

  docker stack services qgis-stack

Something like:

::

  ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
  gmx7ewlvwsqt        qgis_nginx          replicated          1/1                 nginx:1.13          *:8080->80/tcp
  l0v2e7cl43u3        qgis_qgis-server    replicated          1/1                 qgis-server:latest    


To check WMS capabilities, type in a web browser 
http://localhost:8080/qgis-server/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities 

Cleanup
^^^^^^^

To cleanup, type:

.. code-block:: bash

  docker stack rm qgis-stack

Kubernetes
----------

Installation
^^^^^^^^^^^^

If you have a **Docker Desktop** installation, using Kubernetes (aka
k8s) is pretty straight forward:
`enable k8s <https://docs.docker.com/get-started/orchestration/#enable-kubernetes>`_.

If not, follow the
`minikube tutorial <https://kubernetes.io/docs/tutorials/hello-minikube/>`_
or
`microk8s for Ubuntu <https://ubuntu.com/tutorials/install-a-local-kubernetes-with-microk8s>`_.

As Kubernetes installation can be really complex, we will only focus
on aspects used by this demo.
For further / deeper information, check the
`official documentation <https://kubernetes.io/docs/home/>`_.

microk8s
""""""""

microk8s needs extra steps: you have to enable the registry and tag
the qgis-server image in order to have Kubernetes to find the created
images. 

First, enable the registry:

.. code-block:: bash

  microk8s enable dashboard dns registry

Then, tag and push the image to your newly created registry:

.. code-block:: bash

  docker tag qgis-server 127.0.0.1:32000/qgis-server && docker push 127.0.0.1:32000/qgis-server

Finally, add or complete the :file:`/etc/docker/daemon.json` to have
your registry **127.0.0.1:32000** listed in the
**insecure-registries** field:

.. code-block:: json

  {
    "insecure-registries": ["127.0.0.1:32000"]
  }

.. _k8s-manifests:

Creating manifests
^^^^^^^^^^^^^^^^^^

Kubernetes describes the objects to deploy in yaml manifests.
There are many different kinds, but we will only use deployments
(handle pods, i.e. docker images) and services to expose the
deployments to internal or external purposes.

Deployment manifests
""""""""""""""""""""

Create a file :file:`deployments.yaml` with this content:

.. code-block:: yaml

  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: qgis-server
    namespace: default
  spec:
    replicas: 1
    selector:
      matchLabels:
        myLabel: qgis-server
    template:
      metadata:
        labels:
          myLabel: qgis-server
      spec:
        containers:
          - name: qgis-server
            image: localhost:32000/qgis-server:latest
            imagePullPolicy: Always
            env:
              - name: LANG
                value: en_EN.UTF-8
              - name: QGIS_PROJECT_FILE
                value: /data/osm.qgs
              - name: QGIS_SERVER_LOG_LEVEL
                value: "0"
              - name: DEBUG
                value: "1"
            ports:
              - containerPort: 5555
            volumeMounts:
              - name: qgis-data
                mountPath: /data/
        volumes:
          - name: qgis-data
            hostPath:
              path: REPLACE_WITH_FULL_PATH/data
  
  ---
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: qgis-nginx
    namespace: default
  spec:
    replicas: 1
    selector:
      matchLabels:
        myLabel: qgis-nginx
    template:
      metadata:
        labels:
          myLabel: qgis-nginx
      spec:
        containers:
          - name: qgis-nginx
            image: nginx:1.13
            ports:
              - containerPort: 80
            volumeMounts:
              - name: nginx-conf
                mountPath: /etc/nginx/conf.d/
        volumes:
          - name: nginx-conf
            configMap:
              name: nginx-configuration
  
  ---
  kind: ConfigMap 
  apiVersion: v1 
  metadata: 
    name: nginx-configuration
  data: 
    nginx.conf: |
      server {
        listen 80;
        server_name _;
        location / {
          root  /usr/share/nginx/html;
          index index.html index.htm;
        }
        location /qgis-server {
          proxy_buffers 16 16k;
          proxy_buffer_size 16k;
          gzip off;
          include fastcgi_params;
          fastcgi_pass qgis-server:5555;
          }
        }


Service manifests
"""""""""""""""""

Create a file :file:`services.yaml` with this content:

.. code-block:: yaml

  apiVersion: v1
  kind: Service
  metadata:
    name: qgis-server
    namespace: default
  spec:
    type: ClusterIP
    selector:
      myLabel: qgis-server
    ports:
      - port: 5555
        targetPort: 5555
  ---
  apiVersion: v1
  kind: Service
  metadata:
    name: qgis-nginx
    namespace: default
  spec:
    type: NodePort
    selector:
      myLabel: qgis-nginx
    ports:
      - port: 80
        targetPort: 80
        nodePort: 30080

Deploying manifests
^^^^^^^^^^^^^^^^^^^

To deploy the images and services in Kubernetes, one can use the
dashboard (click on the **+** on the upper right) or the command line.

.. note::
   When using the command line with microk8s you will have to prefix
   each command with `microk8s`.

To deploy or update your manifests:

.. code-block:: bash

  kubectl apply -f ./

To check what is currently deployed:

.. code-block:: bash

  kubectl get pods,services,deployment

You should obtain something like::

  NAME                               READY   STATUS    RESTARTS   AGE
  pod/qgis-nginx-54845ff6f6-8skp9    1/1     Running   0          27m
  pod/qgis-server-75df8ddd89-c7t7s   1/1     Running   0          27m
  
  NAME                       TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
  service/Kubernetes         ClusterIP   10.152.183.1     <none>        443/TCP        5h51m
  service/qgis-exec-server   ClusterIP   10.152.183.218   <none>        5555/TCP       35m
  service/qgis-nginx         NodePort    10.152.183.234   <none>        80:30080/TCP   27m
  service/qgis-server        ClusterIP   10.152.183.132   <none>        5555/TCP       27m
  
  NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
  deployment.apps/qgis-nginx    1/1     1            1           27m
  deployment.apps/qgis-server   1/1     1            1           27m
  
To read nginx/qgis logs, type:

.. code-block:: bash

  kubectl logs -f POD_NAME

To check WMS capabilities, type in a web browser 
http://localhost:30080/qgis-server/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities

Cleanup
^^^^^^^

To clean up, type:

.. code-block:: bash

  kubectl delete service/qgis-server service/qgis-nginx deployment/qgis-nginx deployment/qgis-server configmap/nginx-configuration

Cloud deployment
================

Managing your own cluster of servers to handle the deployment of
containerized applications, is a complex job.
You have to handle multiple issues, such as hardware, bandwidth and
security at different levels.

Cloud deployment solutions can be a good alternative when you do not
want to focus on infrastructure management.

A cloud deployment may use proprietary mechanisms, but they are also
compatible with the stages explained previously
(:ref:`docker images <simple-docker-images>` and
:ref:`stack management <docker-stacks>`).

AWS usecase
-----------

With Amazon AWS, through
`ECS (Elastic Container Service) <https://console.aws.amazon.com/ecs/home>`_
functionalities, you can use docker-compose or Kubernetes compatible
wrappers to manage your stack.
You will have to create an
`image registry <https://console.aws.amazon.com/ecr/home>`_ for your
custom images to be accessible.

To use docker-compose alike functionalities, you need to install the
**ecs-cli** client and have `proper permissions / roles
<https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html>`_.
Then, with the help of the `ecs-cli compose <https://github.com/aws/amazon-ecs-cli>`_ commands,
you can reuse the :ref:`stack description <docker-compose-file>`.

To use Kubernetes, you can use the AWS web console or the command line
tool
`eksctl <https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html>`_
and have the proper permissions / roles. Then with a well configured
kubectl environment, you can reuse the :ref:`Kubernetes manifests
<k8s-manifests>`.
