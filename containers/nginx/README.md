- `default.conf` is the nginx default config, with an include directive to location folder conf
- `location_app.conf` location directive to dashboard container
- `.htpasswd` : basic auth with user:pwd
    - bob:bob
    - test:test

# todo
- move *.conf files to config/
- move *.so files to modules/
