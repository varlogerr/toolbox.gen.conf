# Gen.conf tool

Generate basic configs tool

## Installation

```sh
# clone the repository
sudo git clone https://github.com/varlogerr/toolbox.gen.conf.git /opt/varlog/toolbox.gen.conf
# check pathadd.append function is installed
type -t pathadd.append
# in case output is "function" you can make use
# of pathadd-based bash hook. Otherwise add
# '/opt/varlog/toolbox.gen.conf/bin' directory
# to the PATH manually
echo '. /opt/varlog/toolbox.gen.conf/hook-pathadd.bash' >> ~/.bashrc
# reload ~/.bashrc
. ~/.bashrc
# expore the script
gen.conf.sh -h
```

## References

* [`pathadd` tool](https://github.com/varlogerr/toolbox.pathadd)
