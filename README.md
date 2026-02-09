# Tasks Demo - My First Phoenix Project

A simple Phoenix (Elixir) application created while learning Phoenix framework basics.

## Tech Stack

- **Elixir** - Functional programming language
- **Phoenix Framework** - Web framework for Elixir
- **PostgreSQL** - Database
- **Ecto** - Database wrapper and query generator

## Prerequisites

- Elixir 1.14+ 
- Erlang/OTP 25+
- Phoenix 1.7+
- PostgreSQL 14+
- Node.js (for asset compilation)

## Create Phoenix Project
   ``` mix phx.new tasks_demo
       cd tasks_demo 
   ```

## Setup Instructions

### 1. Install dependencies
```bash
mix deps.get
```

### 2. Configure database
Update `config/dev.exs` with your PostgreSQL credentials:
```elixir
config :tasks_demo, TasksDemo.Repo,
  username: "your_username",
  password: "your_password",
  hostname: "localhost",
  database: "tasks_demo_dev",
  port: 5432
```

### 3. Create and migrate database
```bash
mix ecto.create
mix ecto.migrate
```

### 4. Start Phoenix server
```bash
mix phx.server
```

Visit [`localhost:4000`](http://localhost:4000) in your browser.

## Common Issues & Solutions

### PostgreSQL Connection Issues

**Error: `non-existing domain - :nxdomain`**
```bash
# Install and start PostgreSQL
brew install postgresql
brew services start postgresql
pg_isready
```

**Error: `connection refused - :econnrefused`**
- Use `hostname: "localhost"` instead of `127.0.0.1` in config
- PostgreSQL might be running on IPv6 only

**PostgreSQL listening on IPv6 only**
```bash
# Check what's listening
lsof -i :5432

# Edit PostgreSQL config
nano /opt/homebrew/var/postgresql@14/postgresql.conf

# Set: listen_addresses = '*'

# Restart PostgreSQL
brew services restart postgresql@14
```

## What I Learned

- Setting up a Phoenix project from scratch
- Configuring PostgreSQL with Ecto
- Debugging network connection issues (IPv4 vs IPv6)
- Phoenix project structure and configuration
- Basic Elixir patterns: pattern matching, tuples, control structures

## Next Steps

- [ ] Add task CRUD functionality
- [ ] Create HTML templates
- [ ] Add authentication
- [ ] Deploy to production


This project is for learning purposes.
## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
