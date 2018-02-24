## apache-lb

> Docker image of apache load balancer with sticky session enabled

Refer to [https://www.youtube.com/watch?v=6gDW56dS8nU](https://www.youtube.com/watch?v=6gDW56dS8nU).

### How to use

Create a file named `app.conf` and insert the hostnames you would like to be balanced like below:

```
BalancerMember http://10.66.1.1:8000 ROUTE=1
BalancerMember http://10.66.1.2:8000 ROUTE=2
BalancerMember http://10.66.1.3:8000 ROUTE=3
```

(Note: the `ROUTE=<someid>` is needed for sticky session.)

Then build the image and start up the container with the `app.conf` mounted:

```
docker build . -t apache-lb
docker run --name apache-lb --rm -dit -p 8080:80 -v /YOUR/PATH/app.conf:/usr/local/apache2/conf/extra/app.conf apache-lb
```

(Note: you can go to the `/_balancer-manager` to view the balancer manager page)