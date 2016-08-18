# delete_my_tweets

When you just want to start fresh 🐤

![](http://i.giphy.com/5xaOcLwEvFOizxHVyVy.gif)

[![Gem Version](https://badge.fury.io/rb/delete_my_tweets.svg)](https://badge.fury.io/rb/delete_my_tweets)

## Installation

```shell
$ gem install delete_my_tweets
```

## Configuration

```shell
$ delete_my_tweets --config
open this url in your browser (sign in and authorize): https://api.twitter.com/oauth/authorize?oauth_token=qAkIxAAAAAAAkM7bAAABVFNhDts
enter pin: 8166988
wrote config.yml 🐤
```

## Usage

```shell
$ delete_my_tweets
found 122 tweets
1 👋 RT @a2: OH @iwasleeg: “I’m a programmer. I’m paid to think I know what I’m doing.”
2 👋 RT @CoolAssPuppy: Kids, don't do drugs. Also don't start eating @WholeFoods trail mix. Same thing. #Help https://t.co/8Sr1YknywZ
# ...
all done 🐤
```

### Filtering

You can exclude tweets by editing config.yml. The following will exclude tweets with "Add" or "add" from deletion.

```yml
#...
access_token_secret: somethingsomethingsometh..
filter:
  exclude:
    - Add
    - add
```

## Related

| Name | Language | SLOC | Stars |
| ---- | -------- | ---: | ----: |
| [delete-tweets](https://github.com/koenrh/delete-tweets)      |`python` | 49  | 15
| [oldtweets](https://github.com/olivierthereaux/oldtweets)     |`python` | 115 | 26
| [TwitterDelete](https://github.com/mikemcquaid/TwitterDelete) | `ruby`  | 109 | 24

## Contact

- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)

## License

This project is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
