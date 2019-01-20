# Quick-Starting Solr
Solr comes with a guide to run it from the unpacked .tar.gz or installation directory. But the data then ends up in the install directory. The little scripts here help to avoid this and try to keep the installation directory as pristine as possible.


## Scripts

### ./start 
Will start solr. It has a few minimal prerequisites:

- The command `solr` must be findable in $PATH
- SQSDATA (for Solr Quick-Start) environment variable must denote the directory where Solr shall store its data (index, core configs, logs)
- ZKROOT environment variable is either just the underscore character to let Solr use its internal zookeeper, or it is a zk root (chroot included) like `host:port/some/path`. The downside of using Solr's internal zookeeper is that this still then stores zookeeper persisted data somehwere in the installation directory.

### ./update-collection
Creates or updates a collection by first uploading a configuration directory to zookeeper and the either creating or reloading the collection.

The following are needed:

- Requires command `solr` findable in PATH.
- ZKROOT as described above.
- Name of the collection as the single command line argument.
- A directory ./<collection>-config that has a structure like the minimal-config directory.



