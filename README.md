# Homework # B10.5.1
# Skill Factory . 
using Ansible
* create a VM, create user in it (user1)
* create an SSH key pair for this user locally
* encrypt the keys with ansible vault
* make tagged playbook for postfix and user to be able to: 
  -- install postfix using a tag 
  -- won't install postfix using a tag