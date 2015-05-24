# wiki &mdash; a minimalistic wiki

Simple, minimal wiki with focus on code.

## Requirements

  - Python 2.5, 2.6, or 2.7 (`pygments.rb`)
  - PostgreSQL 8.4+ (`full text search`)

## Setup

Set environment variables.

  - `GITHUB_KEY`
  - `GITHUB_SECRET`

Create database and run migrations.

```
rake db:create
rake db:migrate
```

## Features

  - [x] github oauth
  - [x] markdown
  - [x] syntax highlighting
  - [x] abilities (cancan)
  - [x] search
  - [ ] preview (new/edit)
  - [ ] jwt

