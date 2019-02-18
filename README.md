docker-cloudflare
=================

[![](https://images.microbadger.com/badges/image/solidnerd/cloudflare.svg)](https://microbadger.com/images/solidnerd/cloudflare "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/solidnerd/cloudflare.svg)](https://microbadger.com/images/solidnerd/cloudflare "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/solidnerd/cloudflare.svg)](https://microbadger.com/images/solidnerd/cloudflare "Get your own commit badge on microbadger.com") [![](https://images.microbadger.com/badges/license/solidnerd/cloudflare.svg)](https://microbadger.com/images/solidnerd/cloudflare "Get your own license badge on microbadger.com")

[flarectl](https://github.com/cloudflare/cloudflare-go/tree/master/cmd/flarectl) in a docker container for using it in hopefully secure way :). 

Otherwise we should try to secure it more.

### Set Credentials

Create an directory to save your credentials

```bash
mkdir -p $HOME/.cloudflare
```

Now save you credentials in an env file to have them presisent

```bash
cat > $HOME/.cloudflare/env <<EOF
CF_API_KEY=abcdef1234567890
CF_API_EMAIL=someone@example.com
EOF
```


### See Version

USAGE:
```
docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare \
--version
```

### See help

```
docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare \
--help
```
   
### A DNS update example

USAGE | type A record:
```
docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare \
dns create-or-update --zone mysite.com --name mysite.com  --proxy --type A --content 11.22.33.44
```

USAGE | type CNAME record:

```
docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare \
dns create-or-update --zone mysite.com --name api.mysite.com  --proxy --type CNAME --content mysite.com
```

COMMANDS:
```
   list, l		List DNS records for a zone
   create, c		Create a DNS record
   update, u		Update a DNS record
   create-or-update, o	Create a DNS record, or update if it exists
   delete, d		Delete a DNS record
   help, h		Shows a list of commands or help for one command
```
OPTIONS:
```
   --zone 	zone name
   --name 	record name
   --content 	record content
   --type 	record type
   --ttl "1"	TTL (1 = automatic)
   --proxy	proxy through CloudFlare (orange cloud)
```  
### User

USAGE:
```
docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare \
info

```

COMMANDS:
```
   info, i	User details
   update, u	Update user details
   help, h	Shows a list of commands or help for one command
```

---

### Making an Alias for easy start

The intention of this container is that it's a tool container so let him a tool container. 
For this we create an alias to have an normal feeling that this is a "tool" and not a container :)

For a temporay state use the following command 

```bash
alias flarectl='docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare'
```

### Alias for Bash

This make it's persistent in your BASH Shell.

```bash
echo "alias flarectl='docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare'" >> $HOME/.bashrc
```

### Alias for Zsh

This make it's persistent in your ZSH Shell.

```zsh
echo "alias flarectl='docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare'" >> $HOME/.zshrc
```

## Usage of flarectl

### Create DNS Record

```bash
flarectl d c --zone example.com --name test.example.com --type CNAME --content example.com
```

### Delete DNS Record

```bash
flarectl dns delete test.example.com
```
 
