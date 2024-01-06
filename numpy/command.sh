# create numpy image with Dockerfile (from jupyter/base-notebook)and test
$ mkdir ch6_dockerfiles && cd ch6_dockerfiles
../ch6_dockerfiles$ mkdir numpy
../ch6_dockerfiles$ touch ./numpy/Dockerfile
../ch6_dockerfiles$ docker build -t numpy numpy
  [+] Building 15.1s (6/6) FINISHED                                                                                                docker:default
   => [internal] load build definition from Dockerfile                                                                                       0.0s
   => => transferring dockerfile: 115B                                                                                                       0.0s
   => [internal] load .dockerignore                                                                                                          0.0s
   => => transferring context: 2B                                                                                                            0.0s
   => [internal] load metadata for docker.io/jupyter/base-notebook:latest                                                                    0.0s
   => CACHED [1/2] FROM docker.io/jupyter/base-notebook                                                                                      0.0s
   => [2/2] RUN conda install --yes numpy                                                                                                   14.3s
   => exporting to image                                                                                                                     0.8s
   => => exporting layers                                                                                                                    0.8s
   => => writing image sha256:710d1e79b219362d5cac2bbed11a0bd0d35f3a20a8687588a281f4bf7d02d0d1                                               0.0s
   => => naming to docker.io/library/numpy                                                                                                   0.0s
$ docker run -it numpy ipython
  Python 3.11.6 | packaged by conda-forge | (main, Oct  3 2023, 10:40:35) [GCC 12.3.0]
  Type 'copyright', 'credits' or 'license' for more information
  IPython 8.16.1 -- An enhanced Interactive Python. Type '?' for help.
  In [1]: import numpy as np

  In [2]: u = np.array((1,2))

  In [3]: u
  Out[3]: array([1, 2])

  In [4]: np.linalg.norm(u)
  Out[4]: 2.23606797749979

# tag your image
$ docker images
  REPOSITORY               TAG                   IMAGE ID       CREATED         SIZE
  numpy                    latest                710d1e79b219   4 minutes ago   1.25GB
$ docker tag numpy joonowayout/numpy:latest
$ docker images
  REPOSITORY               TAG                   IMAGE ID       CREATED         SIZE
  joonowayout/numpy        latest                710d1e79b219   5 minutes ago   1.25GB

# create registry in docker hub (joonowayout/numpy)
1. hub.docke.com > create Registry
docker login
docker push joonowayout/numpy:latest

