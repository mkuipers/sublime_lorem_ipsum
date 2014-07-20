sublime_lorem_ipsum
===================

Server and client for providing lorem ipsum to a Sublime Text plugin

## Installation
```
mkdir ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/LoremIpsumConsumer
ln -s #{repository_root}/lorem_ipsum_consumer/LoremIpsumConsumer.py ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/LoremIpsumConsumer/LoremIpsumConsumer.py
ln -s #{repository_root}/lorem_ipsum_consumer/Main.sublime-menu ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/LoremIpsumConsumer/Main.sublime-menu
```

Get [pow](http://pow.cx).

`cd lorem_ipsum_provider`

`bundle install`

`powder link`

## TODO
* Consumer: add threading
* Consumer: refactor atrocious python
* Provider: a more rich interface for managing templates
* Provider: integration with [bacon ipsum](http://baconipsum.com/) API