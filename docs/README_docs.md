# pantograph docs

This repo contains all documentation for pantograph. You can find the `.md` files inside the [docs](docs) folder.

To preview the updated documentation locally, just clone the repo, modify the file, and run

```
mkdocs serve
```

The live version is available on [urbanquakers.github.io/pantograph](https://urbanquakers.github.io/pantograph).

## Why new docs?

You can find more information [here](https://github.com/pantograph/docs/issues/5)

## Deploy changes

Once a PR is merged into master, the latest version will automatically be deployed to [urbanquakers.github.io/pantograph](https://urbanquakers.github.io/pantograph) by one of the hard working pantograph bots. No need to do anything manually. The resulting HTML files are stored in the [`gh-pages`](https://github.com/pantograph/docs/tree/gh-pages) branch.

## Installation of [mkdocs](http://www.mkdocs.org/)

```sh
brew install python3 # if you don't have pip already
brew install pipenv
pipenv --three
pipenv shell
pipenv install
```

## Adding a Python dependency

Likely, to add a [Markdown extension](https://pythonhosted.org/Markdown/extensions/), install it with `pipenv install <some extension>` after making sure the virtualenv is loaded (`pipenv shell`).
