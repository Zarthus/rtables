# Contributing

This file is very much 'common sense', it describes ideal practices and for the advanced ruby and git users most of
this will be known.

## Issues

Is RTables not working as you'd like? Do you have a great suggestion? Let us know!

### Feature Suggestions

Any feature suggestion you have is welcome. Denote clearly and concisely what you'd like to see, and elaborate as on
why you think this is a great idea.

### Bugs

Bugs are nasty, but every project has them. Please provide details when you're reporting a bug, the more - the better.

There are some pretty basics that will help us help you. Please try to include:

- What the bug is.
- The command you've issued to encounter the bug.
- Reproduction steps, if available.
- The version

## Pull Requests

You're great, and you know it. Here are some guidelines you can stick to to ensure your pull request has the maximum
success of being accepted. None of them are mandatory (the things that are are tested through CI), but we may ask you
to change, add or rewrite some of your pull request if you've done something that is not in the spirit of what we
strive for.

### Use branch names to describe your change

Branch names help describe your change. Explain what your goal is with this change within the branch name, and try
not to sway from that intent. If you are writing multiple changes unrelated to eachother, please submit multiple pull
requests. Try to remain focused on what your change should do when writing your change.

Personally I am a fan of using branches with a prefix to describe if it is a `change`/`patch`, `fix`, or a `feature`.
But you don't need to follow suit.

Good branch name examples:
- `fix/monospace-table-output`
- `feature/mycooltable`
- `mycooltable`

Bad branch name examples:
- `master` - the default branch, doesn't describe anything.
- `fix-155` - what is issue 155? or did you implement 155 bug fixes? Try to describe the change, not refer to the issue.
- `fixes-monospace-table-output-and-adds-mycooltable` - too long, and deserving of multiple pull requests.

### Analyse rubocop.yml

Rubocup is our style linter, they're the style we would like to see other users use. Testing will fail if the linter
fails.

Rubocop can fix most issues themselves, `rubocop --auto-correct` will fix issues for you when it can.

### Write documentation

#### Rubydocs

Rubydocs express the intent behind what you create for humans, IDE's, and documentation parsers. Provide longevity to
the project by writing clear and understandable code, and document to explain things that might not be immediately
clear to others.

#### Markdown

If you added something specific or unique to the project, feel free to add a new file to the `docs` folder.

If you feel this is not necessary for your change, it probably is not.

### Add your own tests

We've written RTables to make it easily testable. When you write something that can be easily tested, please take some time
and give your change that extra polish. This makes it easy for us to understand what your intentions are with the pull
request, and confirms that it works as intended through continuous intergration.

### Test your changes

Travis CI makes use of two ways to test the changes, if your tests fail on Travis, your pull request will not be
accepted. Before making the pull request, ensure the tests pass by running `rubocop` and `bundle exec rspec`

### Make the pull request

This is the final step. Everything is working brilliantly and your change is ready. You've written a small pull request
description of what your change does, your commit messages are on point and squashed if you felt necessary, and the
tests are all green.

That's it, you're in the all-clear and can submit the pull request - now it's our task to review your pull request
and give feedback if necessary. We will try to get on to it as soon as possible, and thanks for contributing!

## Support

If you need support with contributing, you may ask your question on
[EsperNet in #zarthus](https://webchat.esper.net?channels=zarthus)

## Thanks!

Thanks for making it here, and even considering to contribute. Or perhaps you were just looking for a read. In any
case, I hope it was useful!

