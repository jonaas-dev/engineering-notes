# Linux

- [Basic commands](basic-commands.md) — the reference table: navigation, files, permissions,
  processes. `[EN/CA]`
- [Tips](tips-and-tricks.md) — the ones I kept looking up: find and open in one line, piping,
  text processing. `[EN/CA]`
- [Software and utilities](software.md) — what I install on a new machine and what each is for. `[CA]`
- [tmux](tmux.md) — install, sessions, panes.
- [GraphViz](graphviz.md) — generating diagrams from a `.gv` file on the command line.

## Shell aliases

Aliases go in `~/.bash_aliases`, sourced from `~/.bashrc`:

```bash
alias name='command'
```

The original repo shipped a file of my own aliases. It is not here: it carried absolute paths
into someone else's home directory, and an alias list is personal to a machine anyway.
