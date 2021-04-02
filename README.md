# Cluster-management
Helper scripts for managing clusters
- anaconda_ssh_update.sh - exports current anaconda environment to environment.yml, copies it to the chosen servers and applies it to the default anaconda env
- kill_python.sh - shuts down python for current user across the cluster

## Usage
```bash
. filename.sh username server1 server2...
```
