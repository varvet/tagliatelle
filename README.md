# Tagliatelle

[![Gem Version](http://img.shields.io/gem/v/tagliatelle.svg)](https://rubygems.org/gems/tagliatelle)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "tagliatelle"
```

And then execute:

```sh
$ bundle
```

Generate model classes and migrations:

```sh
$ rails generate tagliatelle:install
```

Review the generated migrations then migrate:

```sh
$ rake db:migrate
```

## Usage

Tagliatelle expects two classes to be defined:

```ruby
class Tag < ActiveRecord::Base
  include Tagliatelle::Tag
end

class Tagging < ActiveRecord::Base
  include Tagliatelle::Tagging
end
```

You can add or override behavior to these classes as needed.

Then to make an object taggable:

```ruby
class Article < ActiveRecord::Base
  include Tagliatelle::Taggable
end
```

To tag an object:

```ruby
article = Article.first
article.tag_list = "foo, bar"
article.save
```

To retrieve the tags of an object:

```ruby
article = Article.first
article.tag_list
```

To query objects based on tags:
```ruby
Article.tagged_with(["foo", "bar"])
```
