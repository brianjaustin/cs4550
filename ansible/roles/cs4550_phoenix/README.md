# CS4550 Phoenix Role
This role is used to setup and deploy an Phoenix
webapp under its own user account.

## Variables
* `site_name` - what the website will be called. This is used for nginx config and username. Typically this will be something like `hw04`.
* `service_port` - the port on which the Phoenix service will serve and to which nginx
should proxy.
