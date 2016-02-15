# hubot-hash

Collect message hashtags.
Require starting redis-server at localhost:6379.

See [`src/hash.coffee`](src/hash.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install https://github.com/kaakaa/hubot-hash.git --save`

Then add **hubot-hash** to your `external-scripts.json`:

```json
[
  "hubot-hash"
]
```

## Sample Interaction

```
user1>> Hello Yesterday! #team
hubot>> learn by heart
user1>> Goodbye Yesterday! #team
hubot>> learn by heart

user1>> @hubot REPORT_FROM_YESTERDAY
hubot>> Hello Yesterday!
hubot>> Goodbye Yesterday!
hubot>> CLEAR_MESSAGE
```
