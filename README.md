# Experiments with Gradle Profiler

> _Companion repo for my talk "Experiments for your Android builds driven by Gradle Profiler"_

## Context

Talk and examples delivered in the following events

- [N26 Android Meetup](https://www.meetup.com/N26-Tech-Product-Design-Events-in-Barcelona/events/268447714/) (February / 2020)
- [GDG SP Android Meetup](https://www.meetup.com/GDG-SP/events/269067015/) (March / 2020)
- [Droidcon EMEA](https://www.online.droidcon.com/emea2020) (October / 2020)
- [Android Summit](https://emamo.com/event/android-summit-2020) (October / 2020)

## Quick Links

- [Gradle Profiler repository](https://github.com/gradle/gradle-profiler)
- [Online Paired T-test calculator](https://www.statskingdom.com/160MeanT2pair.html)
- [Paired T-test CLI tool](https://github.com/dotanuki-labs/gradle-profiler-pttest)
- [Presentation slides on Speakerdeck](https://speakerdeck.com/ubiratansoares/experiments-for-your-android-builds-driven-by-gradle-profiler)
- Blog post (TODO)

## Experiments covered

### From 2020 / H1

In the early of 2020 I run the following benchmarks locally, quite manually but I've kept the datasets. These were the examples and datasets I've used in my public talks about Gradle Profiler.

#### Building Kotlin MPP with different JDKs

- Target : [SdkSearch](https://github.com/JakeWharton/SdkSearch)
- Datasets :[conferences/sdksearch-kmpp-different-jdks](conferences/sdksearch-kmpp-different-jdks)
- Goal : demonstrate that builds don't improve when building Kotlin MPP with JDK11 instead of JDK8

#### Bumping Gradle + AGP version

- Target : [IOSched](https://github.com/google/iosched)
- Datasets :[conferences/iosched-updating-gradle-agp](conferences/iosched-updating-gradle-agp)
- Goal : demonstrate that bumping Gradle + AGP from 3.4.x to 3.6.x brings a lot of improvement in the Android build

### From 2020 / H2

#### Building Kotlin MPP with different JDKs

- Target : [SdkSearch](https://github.com/JakeWharton/SdkSearch)
- Datasets :[sdksearch-kmpp-different-jdks](sdksearch-kmpp-different-jdks)
- Goal : demonstrate that builds don't improve when building Kotlin MPP with JDK11 instead of JDK8

Running the experiment and generating data by yourself (OSX only)

1. Make sure you have `git`, `gradle-profiler`, `jdk8` and `jdk11` installed
2. Run the companion script

```bash
cd sdksearch-kmpp-different-jdks
./run.sh
```

#### Bumping Gradle + AGP version


- Target : [Sunflower](https://github.com/android/sunflower)
- Datasets :[sunflower-agp-bump-4.0.x](sunflower-agp-bump-4.0.x)
- Goal : demonstrate that bumping Gradle + AGP from 3.6.x to 4.0x `DOES NOT` bring improvements in the Android build at all

Running the experiment and generating data by yourself (OSX only)

1. Make sure you have `git`, `gradle-profiler` and `jdk8` installed
2. Run the companion script

```bash
cd sunflower-agp-bump-4.0.x
./run.sh
```

## Author

Ubiratan Soares (follow me on [Twitter](https://twitter.com/ubiratanfsoares))

## License

```
The MIT License (MIT)

Copyright (c) 2020 Dotanuki Labs

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
