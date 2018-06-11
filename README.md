# osjs-lerna

This is the [lerna](https://github.com/lerna/lerna) setup for OS.js v3.

**This project is only intended for repository maintainers**

## Setup

```
# First, install lerna
npm install

# Then clone all repositories
./clone.sh

# Then run all linking
./link.sh
```

You now have a fully working development environment *and* publishing support.

## Usage

```
# Show all packages
npx lerna ls

# Run all tests
npx lerna run test

# See what packages are queued
npx lerna updated

# Publish packages
npx lerna publish -m "Version bump"
```
