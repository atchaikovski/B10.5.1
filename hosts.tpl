[postfix]
%{ for index,ip in list_vm ~}
postfix-server ansible_host=${ip}
%{ endfor ~}

