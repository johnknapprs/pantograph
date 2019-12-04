<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/johnknapprs/pantograph/blob/master/pantograph/lib/pantograph/actions/last_git_commit.rb
-->

# last_git_commit


Return last git commit hash, abbreviated commit hash, commit message and author







last_git_commit ||
---|---
Supported platforms | ios, android, mac
Author | @ngutman
Returns | Returns the following dict: {commit_hash: "commit hash", abbreviated_commit_hash: "abbreviated commit hash" author: "Author", author_email: "author email", message: "commit message"}



## 1 Example

```ruby
commit = last_git_commit
crashlytics(notes: commit[:message]) # message of commit
author = commit[:author] # author of the commit
author_email = commit[:author_email] # email of the author of the commit
hash = commit[:commit_hash] # long sha of commit
short_hash = commit[:abbreviated_commit_hash] # short sha of commit
```





<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
pantograph action last_git_commit
```

<hr />

## CLI

It is recommended to add the above action into your `Pantfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
pantograph run last_git_commit
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
pantograph run last_git_commit parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _pantograph_ actions you use to your `Pantfile`.

<hr />

## Source code

This action, just like the rest of _pantograph_, is fully open source, <a href="https://github.com/johnknapprs/pantograph/blob/master/pantograph/lib/pantograph/actions/last_git_commit.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>