<!--
This file is auto-generated and will be re-generated every time the docs are updated.
To modify it, go to its source at https://github.com/johnknapprs/pantograph/blob/master/pantograph/lib/pantograph/actions/prompt.rb
-->

# prompt


Ask the user for a value or for confirmation




> You can use `prompt` to ask the user for a value or to just let the user confirm the next step.<br>When this is executed on a CI service, the passed `ci_input` value will be returned.<br>This action also supports multi-line inputs using the `multi_line_end_keyword` option.


prompt ||
---|---
Supported platforms | ios, android, mac
Author | @KrauseFx



## 2 Examples

```ruby
changelog = prompt(text: "Changelog: ")
```

```ruby
changelog = prompt(
  text: "Changelog: ",
  multi_line_end_keyword: "END"
)

crashlytics(notes: changelog)
```





## Parameters

Key | Description | Default
----|-------------|--------
  `text` | The text that will be displayed to the user | `Please enter some text: `
  `ci_input` | The default text that will be used when being executed on a CI service | `''`
  `boolean` | Is that a boolean question (yes/no)? This will add (y/n) at the end | `false`
  `secure_text` | Is that a secure text (yes/no)? | `false`
  `multi_line_end_keyword` | Enable multi-line inputs by providing an end text (e.g. 'END') which will stop the user input | 

<em id="parameters-legend-dynamic">* = default value is dependent on the user's system</em>


<hr />



## Documentation

To show the documentation in your terminal, run
```no-highlight
pantograph action prompt
```

<hr />

## CLI

It is recommended to add the above action into your `Pantfile`, however sometimes you might want to run one-offs. To do so, you can run the following command from your terminal

```no-highlight
pantograph run prompt
```

To pass parameters, make use of the `:` symbol, for example

```no-highlight
pantograph run prompt parameter1:"value1" parameter2:"value2"
```

It's important to note that the CLI supports primitive types like integers, floats, booleans, and strings. Arrays can be passed as a comma delimited string (e.g. `param:"1,2,3"`). Hashes are not currently supported.

It is recommended to add all _pantograph_ actions you use to your `Pantfile`.

<hr />

## Source code

This action, just like the rest of _pantograph_, is fully open source, <a href="https://github.com/johnknapprs/pantograph/blob/master/pantograph/lib/pantograph/actions/prompt.rb" target="_blank">view the source code on GitHub</a>

<hr />

<a href="/actions/"><b>Back to actions</b></a>