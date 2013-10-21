dockerfiles
===========

Some Dockerfiles for [docker](http://docker.io/).

Making your own images is easy!

Let's assume you want to create an image of the ruby-2.0.0 Dockerfile.  Simply check out this repo and cd into the ruby-2.0.0-stable directory and:

```
sudo docker build -t ruby-2.0.0 .
```

That will build an image tagged ruby-2.0.0:latest

Convetion
---------

I am using multiple builds at times to make final images.  As such, Dockerfiles make assumptions that certain images exist.

For example, the puppet-3.2.4 Dockerfile assumes that there is an image named 'ruby-1.9.3'.  This may be created from the Dockerfile
under the ruby-1.9.3-p448 folder with the tag name ruby-1.9.3.


Once that image is created, the puppet Dockerfile build should run just fine!

