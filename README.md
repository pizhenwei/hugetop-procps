# hugetop

An utility to show huge page information, it's helpful for troulbe
shooting on huge page environment. For example, QEMU/SPDK/DPDK are
performance sensitive, they are typically deployed with huge pages.

## hugetop debian package
hugetop utility is part of procps(since 2024-01-31), it would be
supported on Debian 12. Unfortunately, Debian 9/10 would not updrade
procps package.

Statically built hugetop is necessary on the lower Debian, then we
have a separated binary *hugetop* which would not affect library of
procps.

Contact: zhenwei pi <pizhenwei@bytedance.com>
