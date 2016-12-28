docker-cloudflare
=================

Flarectl in a docker container for using it in hopefully secure way :)

# Quickstart

```bash
docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare --help
```

# Making an Alias for easy start

```bash
alias flarectl='docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare'
```

## Alias for Bash
```bash
echo "alias flarectl='docker run -it --rm --env-file $HOME/.cloudflare/env solidnerd/cloudflare'" >> $HOME/.bashrc
```

## Alias for Zsh
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
flarectl d d test.example.com
```

# ToDo
- [] add user 
- [] su-exec 
 