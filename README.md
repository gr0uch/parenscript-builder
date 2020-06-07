# ParenScript Builder

Transform ParenScript, a subset of Common Lisp, to JavaScript modules, compatible with Deno and web browsers (and Node.js too).

Somewhat based on [sigil](https://github.com/burtonsamograd/sigil).

## Install

```
./build.sh
```

## Usage

```
psbuild <filename1.lisp> ... <filenameN.lisp>
```

Output is written to `stdout`.

## ES Modules

To import an ES Module:
```
(import
  :default <name of variable>
  :names (<names of variables>)
  :path "./<path to module>.mjs")
```

To export an ES Module:
```
(export
  :default <name of variable>
  :names (<names of variables>))
```

## License

[WTFPL v2](http://www.wtfpl.net/)
