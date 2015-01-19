Like it says on the tin, this guide covers contributing to Tea
With Strangers. It includes sections on the following:

1. Our Community, Communications, and Processes 
2. Engineering [*WIP*]
3. <del>Design</del> [*Coming Soon&hellip;ish*]
4. <del>PM, Business-y Stuff</del> [*We'd say coming soon, but it'd be a
   complete lie.*]

All but the first are discipline-specific. Read up on [how we
work](#how-we-work) and then feel free to jump to the section most relevant to
your interests. Or read all of it. At the very least, leave the tab open.
Please? It's good for our time-on-page stat.

This will gradually become more detailed. Really. No, no. *Really*.

<h3 id='how-we-work'>How We Work</h3>

If we do say so ourselves, the TWS community is pretty cool. Our dozens of
amazing hosts have literally convinced **thousands** of people to temporarily
halt their Sisyphean quest to reach the bottom of their Netflix queue so that
they can meet strangers and talk about life, friendship, and whatever else comes
up.

<!-- Camaraderie and mutual respect makes tea time tea time, and we believe it's just
as essential to the behind-the-scenes efforts that make Tea With Strangers
possible. -->

> If you haven't been to a tea time yet, now's your chance! Head over to [Tea
> With Strangers](http://teawithstrangers.com) and find one in your city!

Still reading? Great! No? Oh&hellip;ANYWAYS, the way we organise things is
simple. **Warning**: If you've ever worked at a trendy startup, it may be
uncomfortably familiar.

* Product planning, bug tracking, etc. happens on
  [Trello](https://trello.com/teawithstrangers).
* Day-to-day chat is in [Slack](https://twsfam.slack.com). 
* Code and other engineering essentials live on
  [GitHub](https://github.com/teawithstrangers)

We encourage you to bookmark these links. Or not. Your prerogative. To get an
invite to Slack, shoot [Nick or Ankit an email](/team). It's where 90% of
communication happens. The remaining 8% of chatter<sup>2</sup> is via email.

### Engineering<sup>1</sup>

Our current set of projects are:

* [`tws-on-rails`](https://github.com/TeaWithStrangers/tws-on-rails),
  which powers the `teawithstrangers.com` you know and (hopefully) love.
* [`strainer`](https://github.com/TeaWithStrangers/strainer): our analytics
  dashboard. It's powered by [Dashing](http://shopify.github.io/dashing/).
* [`making-tws`](https://github.com/TeaWithStrangers/making-tws): you're staring
  at it.
* [`tws-styles`](https://github.com/TeaWithStrangers/tws-styles): a set of
  stylesheets and assets shared across all of TWS' properties.

Now you're familiar with our b-e-a-utiful menagerie of exciting and dynamic
repositories, it's time for:

#### Your First Pull Request

Head over to the [Product Backlog
](https://trello.com/b/HVzlTFej/tea-with-strangers-tech-backlog) and take a
gander at the *Cool Beans* board.

These are projects we've explicitly set aside for brand new contributors. For
experienced developers, they're small tasks that shouldn't take more than an
hour whilst familiarising you with the codebase. If you're a novice, we hope they'll introduce you
to some new concepts and the realities of working on a Real Project™ without
taking up your entire day.

> Don't see something you're interested in? Still want to contribute? [Let Nick
> know!](mailto:nb@ul.io?subject=I hate everything you suggested I work on!)
> He'll find work for you. Promise.

Now that you know **exactly** what you're going to do, the fun can really begin.
Clone a project you'd like to work on. It'll have a misleadingly simple `README.md`
that explains how to get a basic dev environment configured in a perfect world
where you have all of the proper headers in place and the insanely specific
version of `gcc` that `libv8` needs to compile this week. BUT DON'T YOU WORRY.
Usually by the time you've exhausted every magical command line incantation
meant to resolve the problem the phase of the moon has changed and you'll be
able to install everything AOK NO PROBLEMO. If not, we suggest waiting until
Friday. Never could get the hang of Thursdays.

Now what happens is that we use a [feature branch
workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)
for all of our projects. Choose a descriptive name that bears some relation to
    what you're working on.  If you're fixing a bug where line spacing is
    incorrect on hosting pages, a good branch name might be
    `bug/hosting-page-line-spacing-fix`. A bad name would be `bug/lol-css`.

At this point, you should be all set to get working. If at any stage in the
process you have questions about what to do next or are unsure of what the best
approach would be, feel free to ask in Slack or, better yet, open up a pull
request. It's never too early to solicit feedback from other contributors!

Finally, Our goal is to be as open to new contributors as possible. If there's
ever anything we can do to improve, please don't hesitate to let Nick or Ankit
know!

We look forward to your contributions :)

<!---
##### Final Notes / Common Problems

* We deploy to servers with case-sensitive file systems. If you reference `foo.jpg` in your
  HTML, but commit it as `Foo.jpg`, it won't work in production.

* TravisCI and Coveralls automatically report in on every pull request and
  commit.

* Don't worry about rebasing your commit on top of `master`. The person in
  charge of deploying your branch will do it for you.

-->

<h5 style='margin-bottom: 0px;'>Footnotes</h5>
<p class="quote">1: Or not engineering. Our standards are flexible.</p>
<p class="quote">2: 2% is lost to communication overhead. Did we mention we were told there'd</p>
<p class="quote">be no math?</p>
<p class="quote">4: Engineering is based in Bellevue. Accordingly, we operate on Valve time.</p>

<sub style='float: right;'>Last Revision: Sun Jan 18</sub>
