************************
Containerized deployment
************************

.. only:: html

   .. contents::
      :local:
      :depth: 2

There are many ways to use containerised application, from the most simple (simple Docker images) to sophisticated (Kubernetes and so on).

.. note:: This kind of deployment needs the `docker application <http://docker.com>`_ to be installed and running. Check
          this `tutorial <https://www.docker.com/101-tutorial>`_ to begin.

Simple docker images
====================

Dockerfile samples and build instructions are available on `OSLANDIA docker-qgis repository
<https://gitlab.com/Oslandia/qgis/docker-qgis/-/tree/master/qgis-exec>`_.

Download or clone the repository then, in the retrieved directory, build the image with:

.. code-block:: bash

  docker build -f Dockerfile-buster -t qgis-server ./

First try
---------

You can run the server with:

.. code-block:: bash

  docker network create qgis
  docker run -d --rm --name qgis-server --net=qgis --hostname=qgis-server \
                -v $(pwd)/data:/data:ro -p 5555:5555 \
                -e "QGIS_PROJECT_FILE=/data/osm.qgs" \
                qgis-server

.. note:: Options used explanation:
          **-d**: run in background
          **--rm**: remove container when it will be stopped
          **--name**: container name to be created
          **--net**: sub network created previously
          **--hostname**: container hostname, can be referenced later
          **-v**: mount local data directory into container
          **-p**: host/container port mapping
          **-e**: env var to be used in container

To check, type and you should see a line with **qgis-server**:

.. code-block:: bash

  docker ps | grep qgis-server


Usable sample
-------------

As the server is only accepting fastcgi connections, you have to had an http server to handle this protocol.
To do so we have to create a simple Nginx configuration file and start a Nginx image.

Create a file :file:`nginx.conf` in the current directory with this content:

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

To check, type in a browser: `http://localhost:8080/qgis-server/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities <http://localhost:8080/qgis-server/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities>`_


Cleanup
-------

To cleanup the running images you should type:

.. code-block:: bash

  docker stop qgis-server nginx


Docker stack
============

The previous way is scriptable but not easily packageable nor standardized neither easily manageable.

To work with a docker image set you could use a docker stack managed by an orchestrator. In a stack, the images are
working in the same private network, you can start/stop a whole stack in the good order or deploy stack to other
workers. They are many orchestrators, for example Swarm (lately docker-compose), Kubernetes, Mesos.


Swarm/docker-compose
--------------------

Docker, by eating docker-compose, has now its own orchestrator: Swarm.

`Enable it <https://docs.docker.com/get-started/orchestration/#enable-docker-swarm>`_ (Mac version will also work with
Linux).  Now you have Swarm working, create the service file (see `deploy swarm
<https://docs.docker.com/get-started/swarm-deploy/>`_) :file:`qgis-stack.yaml`:

.. code-block:: yaml
    
  version: '3.7'
  
  services:
    qgis-server:
      # Should use version with utf-8 locale support:
      image: qgis-server:latest
      volumes:
      - ./data:/data:ro
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
      - ./nginx.conf:/etc/nginx/conf.d/default.conf:ro
      depends_on:
      - qgis-server
  

To deploy (or update) the stack, type:

.. code-block:: bash

  docker stack deploy -c qgis-stack.yaml qgis-stack

Check stack deployment status until you obtain **1/1** in **replicas** column, type:

.. code-block:: bash

  docker stack services qgis-stack

Something like:

::

  ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
  gmx7ewlvwsqt        qgis_nginx          replicated          1/1                 nginx:1.13          *:8080->80/tcp
  l0v2e7cl43u3        qgis_qgis-exec      replicated          1/1                 qgis-exec:latest    


To check, type in a browser: `http://localhost:8080/qgis-server/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities <http://localhost:8080/qgis-server/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities>`_

To cleanup, type:

.. code-block:: bash

  docker stack rm qgis-stack


Kubernetes
----------

If you are using Docker Desktop installation, using Kubernetes is pretty straight forward 
