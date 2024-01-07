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
login hub.docke.com > create Registry numpy
$ docker login
$ docker push joonowayout/numpy:latest
  latest: digest: sha256:40f43da4e461e59dd3c8a50b25c7d5893e379fdf981128a63001afb9af499d72 size: 4697
$ git init
  ...
  Initialized empty Git repository in /home/joo/docker/data-science/ch6_dockerfiles/.git/
$ git add ./numpy/Dockerfile
$ git commit -m 'from jupyter/base-notebook, numpy installed'
[master (root-commit) e93e912] from jupyter/base-notebook, numpy installed
 2 files changed, 49 insertions(+)
 create mode 100644 numpy/Dockerfile
 create mode 100644 numpy/command.sh
$ git remote add origin https://github.com/guinessjulie/dockerfiles_jupyter.git
$ git push -u origin master
  Username for 'https://github.com': guinessjulie
  Password for 'https://guinessjulie@github.com':
  Enumerating objects: 5, done.
  Counting objects: 100% (5/5), done.
  Delta compression using up to 32 threads
  Compressing objects: 100% (4/4), done.
  Writing objects: 100% (5/5), 1.23 KiB | 1.23 MiB/s, done.
  Total 5 (delta 0), reused 0 (delta 0), pack-reused 0
  To https://github.com/guinessjulie/dockerfiles_jupyter.git
   * [new branch]      master -> master
  Branch 'master' set up to track remote branch 'master' from 'origin'.
$ git push -u origin master
  Branch 'master' set up to track remote branch 'master' from 'origin'.
  Everything up-to-date
$ git add ./numpy/command.sh
$ git commit -m 'terminal command instructions so far'
  [master 432a0ed] terminal command instructions so far
  1 file changed, 30 insertions(+), 3 deletions(-)
$ git push
  Enumerating objects: 7, done.
  Counting objects: 100% (7/7), done.
  Delta compression using up to 32 threads
  Compressing objects: 100% (3/3), done.
  Writing objects: 100% (4/4), 1008 bytes | 1008.00 KiB/s, done.
  Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
  remote: Resolving deltas: 100% (1/1), completed with 1 local object.
  To https://github.com/guinessjulie/dockerfiles_jupyter.git
     e93e912..432a0ed  master -> master


