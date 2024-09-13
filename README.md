
# Run-Script

This is only a test.

## Description

NeoVim plugin to run scripts from line, selected text or current file.

## Requirements

- NVIM v0.10.1

## Instalation

- Lazy

```
{ "devmuu/nvim-run-script", lazy = false }
```

## Commands usage

Run current line in normal mode:

```
RunLineScript
```

Run current line in temporary file inside normal mode:

```
RunFileScript
```

Run selected lines in temporary file inside visual mode:

```
RunFileScript
```

Clear temporary file

```
ClearFileScript
```

## Keybinds

Run current or selected lines:

```
<Ctrl-Enter>
```

Clear temporary file:

```
<F9>
```
