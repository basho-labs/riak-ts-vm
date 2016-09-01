* Self contained Riak TS virtual machine with additional tooling

This installation and configration is meant to be used as a quick start development environment for Riak TS in a low cpu/low memory virtual machine. It is specifically configured to operate as a single, non-clustered instance.  Riak, by design, is meant to be deployed as a cluster. This specific configuration should not be used for benchmarking and certainly not in production. The virtual machine includes a number of languages, tools and Spark to get you started.

# Getting Started

1. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html).
3. Clone this repo and cd into it.
4. Run ```vagrant up```
5. The desktop should come up, if not do a `vagrant halt` / `vagrant up` cycle.
6. Log into the machine as u: vagrant, p: vagrant

# Software included:

- Ubuntu 14.04 LTS
- Riak TS 1.4.0
- Spark 2.0.0
- Scala 2.11.8
- Python 2.7.11, pip
- NodeJS.latest
- Riak TS/Spark demo from [riak-ts-aarhus-demo](https://github.com/siculars/riak-ts-aarhus-demo)
