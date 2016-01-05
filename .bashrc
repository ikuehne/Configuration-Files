alias gvim="gvim -c 'set tb='"

# OPAM configuration
. /home/ikuehne/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
eval `opam config env`
