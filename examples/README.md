# Simple Config

Ths config works for my generator example. Copy the `.github` folder into your own project.

For every commit to main, Github Actions will build your project and test it with the `ci-tests/GeneratorConfig.json`.

The reason for this redundant `GeneratorConfig.json` is to have the absolute paths work for Github Actions.
