# Symfony template

## Installation

1. Copy the `.env.dist` to `.env` file.

```bash
cp .env.dist .env
```

2. Build the containers.

```bash
make build
```

3. Start the containers and import RabbitMQ configuration.

```bash
make start
```

4. Check all commands available from the `Makefile`.

```bash
make help
```

## Access to services

### RabbitMQ

Go to [RabbitMQ Management](http://0.0.0.0:15672/) with the ultra secure credentials `guest`/`guest`.

### PostegreSQL

Connect the database with your favorite client `jdbc:postgresql://root:root@0.0.0.0:5432/app`.

Enjoy! 🍻
