tutum-docker-wordpress
======================

Usage
-----

To create the image `endrjuskr/wordpress`, execute the following command on the tutum-docker-wordpress folder:

	docker build -t endrjuskr/wordpress .


Running your Wordpress docker image
-----------------------------------

Start your image:

	docker run -d -p 80:80 endrjuskr/wordpress

Test your deployment:

	curl http://localhost/

You can now start configuring your Wordpress container!
