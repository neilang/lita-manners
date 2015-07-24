# lita-manners

[![Build Status](https://travis-ci.org/neilang/lita-manners.png?branch=master)](https://travis-ci.org/neilang/lita-manners)
[![Coverage Status](https://coveralls.io/repos/neilang/lita-manners/badge.png)](https://coveralls.io/r/neilang/lita-manners)

Makes Lita politely respond to simple hello/goodbye/thank you/sorry commands and mentions.

## Installation

Add lita-manners to your Lita instance's Gemfile:

``` ruby
gem "lita-manners"
```

## Configuration

There is no configuration.

## Usage

Give Lita basic manners to answer questions.

Saying hello...

```
# Mentions
You: Hello Lita
Lita: Hello You

# Commands
You: @lita hi!
Lita: hi You
```

Saying goodbye...

```
# Mentions
You: Goodbye Lita
Lita: Goodbye You

# Commands
You: @lita bye!
Lita: bye You
```

Saying you're welcome...

```
# Mentions
You: Thank you Lita
Lita: You're welcome You

# Commands
You: @lita thanks
Lita: You're welcome You
```

Accepting an apology...

```
# Mentions
You: Sorry Lita
Lita: Apology accepted You

# Commands
You: @lita I'm sorry
Lita: Apology accepted You
```
