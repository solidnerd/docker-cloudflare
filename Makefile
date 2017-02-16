
build:
	@docker build -f Dockerfile.build -t solidnerd/cloudflare:build .
	@docker create --name="cloudflare-build" solidnerd/cloudflare:build
	@docker cp cloudflare-build:/flarectl .
	@docker build -f Dockerfile -t solidnerd/cloudflare .
	@docker rm -f cloudflare-build
	@docker rmi solidnerd/cloudflare:build
	@rm flarectl

env:
  @echo "CF_API_KEY=abcdef1234567890" > .env
  @echo "CF_API_EMAIL=someone@example.com" >> .env