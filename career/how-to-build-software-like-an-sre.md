# How to Build Software like an SRE

Source: <https://www.willett.io/posts/precepts/>

## Coding (parameter? I hardly know ‘er)

---

### Never give up on local testing

Containerizing the local test environment can make it easier to keep dependencies straight and consistent across machines

:warning: Tool: [toast](https://github.com/stepchowfun/toast).

## Merging (where we’re going, we don’t need tests)

---

### Use Git

Use it for everything – infrastructure, configuration, code, dashboards, on-call rotations. Your git repository is your point-in-time-recoverable source of truth.

### Prioritize real-world validation

The highest-value-per-time-spent kind of test is just pushing your change to staging (or better, prod!) and showing it does what you wanted and doesn’t break everything. Second best is integration tests, with unit tests notably coming in last place – i.e. “only if you have some time”.

:warning: [estic super en contra del que diu]

## Deploying (no sleep til prod)

---

### Deploy everything all the time

Every day that goes by without you deploying increases the chances that it’s actually secretly been broken (by someone’s change, an dependency update, an third-party API removal), and `it’s very hard to track down what went wrong two weeks after the fact`.

### Enable limited “instant” config rollouts

It might sound counterintuitive (since an “instant” rollout often means “break everything all at once”) `but the ability to disable a problematic feature flag or add an IP to a blocklist in under 5 minutes more than offsets the increased risk`. It enables everyone to move fast, but must be managed carefully!

## Operating (my god, it’s full of pods)

---

### Use Kubernetes

Kubernetes gives infra teams scalability superpowers

### Use Helm

Or some other tool for `managing Kubernetes manifests`, I’m not picky – the important thing is that you ~never directly use kubectl apply, edit, or delete. The resource lifecycle needs to be findable in version control.

### Run 3 of everything

Like with backups, two is one and one is none.
