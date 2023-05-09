# Git conventional commit messages

> **Note**
> This is adapted from [Discord.js commit convention](https://github.com/discordjs/discord.js/blob/main/.github/COMMIT_CONVENTION.md) and [Conventional commits](https://www.conventionalcommits.org).

## TL;DR

Messages must be matched by the following regex:

```js
/^(revert: :rewind: )?(feat(\(.+\))?: :sparkles:|fix(\(.+\))?: :bug:|docs(\(.+\))?: :memo:|style(\(.+\))?: :art:|refactor(\(.+\))?: :recycle:|perf(\(.+\))?: :zap:|test(\(.+\))?: :test_tube:|build(\(.+\))?: :package:|ci(\(.+\))?: :infinity:|chore(\(.+\))?: :wrench:) .{1,72}/;
```

### Examples

Appears under "features" header, `scope` subheader:

```text
feat(scope): :sparkles: add 'tag' method
```

Appears under "fixes" header, `scope` subheader, with a link to issue #1:

```text
fix(scope): :bug: handle events correctly

close #1
```

Appears under "performance" header, and under "Breaking Changes" with the breaking change explanation and symbol:

```text
perf(core)!: :zap: improve patching by removing 'bar' option

BREAKING CHANGE: The 'bar' option has been removed.
```

The following commit and commit `410fbbc` do not appear in the changelog if they are under the same release. If not, the revert commit appears under the "Reverts" header.

```text
revert: :rewind: feat(Managers): :sparkles: add Managers

This reverts commit 410fbbc5c4d0072b9bb97a466f56b07c90b926be.
```

### Full Message Format

A commit message consists of a **header**, **body** and **footer**. The header has a **type**, **scope** and **subject**:

```text
<type>(<scope>): :emoji: <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

> **Note**
> The **header** is mandatory and the **scope** of the header is optional.
> If your aren't using it, it should looks like this: `<type>: :emoji: <subject>`

### Revert

If the commit reverts a previous commit, it should begin with `revert:`, followed by the header of the reverted commit. In the body, it should say: `This reverts commit <hash>.`, where the hash is the SHA of the commit being reverted.

### Type

If the prefix is `feat`, `fix` or `perf`, it will appear in the changelog. However, if there is any [BREAKING CHANGE](#footer), the commit will always appear in the changelog.

Other prefixes are up to your discretion. Suggested prefixes are `docs`, `chore`, `style`, `refactor`, and `test` for non-changelog related tasks.

### Scope

The scope could be anything specifying the place of the commit change. For example `Object`, `Array`, `Class` etc...

### Subject

The subject contains a succinct description of the change:

- use the imperative, present tense: "change" not "changed" nor "changes"
- don't capitalize the first letter
- no dot (.) at the end

### Body

Just as in the **subject**, use the imperative, present tense: "change" not "changed" nor "changes".
The body should include the motivation for the change and contrast this with previous behavior.

### Footer

The footer should contain any information about **Breaking Changes** and is also the place to
reference GitHub issues that this commit **Closes**.

**Breaking Changes** should start with the word `BREAKING CHANGE:` with a space or two newlines. The rest of the commit message is then used for this.
