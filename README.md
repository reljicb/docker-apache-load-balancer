Apache 2.4 load balancer

# Features

- sticky sessions / session affinity
- TLS secure connection with downstream services
- TLS secure listening port (8443)


# Run load balancer

1. Open new terminal
1. `./run-httpd.sh`

I order to see the effect of load balancing, run two test downstream services :

1. Open new terminal
1. `cd test`
1. `python serv_1_secure.py`
1. Open new terminal
1. `cd test`
1. `python serv_2_secure.py`

To make a request

1. Open Postman
2. Clean all requst cookies
3. Send `GET https://localhost:8443/rbcone-registry/test`

Load blancer will forward call to a random route and set `ROUTEID` key/value pair in the cookies.
Every subsequent call will be forwared to the same route, as long as the cookie is set as above. 
Clean the cookeies to get another route used.

# SSL

cacerts password: `changeit` 

