# ------------------- EC2 resources ---------------------------------

resource "aws_instance" "myvm" {
  ami                         = "ami-0e472ba40eb589f49" # ubuntu
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = "aws_adhoc"
  count                       = var.vm_count
  associate_public_ip_address = true
  availability_zone           = var.az

  tags = { 
    Name = "Postfix Server # ${count.index}"
  }

}

# --------------- write inventory file ---------------------

 resource "local_file" "inventory" {
	  content = templatefile("${path.module}/hosts.tpl", {
		list_vm = slice(aws_instance.myvm.*.public_ip, 0, var.vm_count),
	  })
	  filename = "inventory"
	}

# --------- launch Ansible to deploy postfix on the resources ---------

/*
resource "null_resource" "null1" {
  depends_on = [
     local_file.inventory
  ]

  provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "local-exec" {
     command = "ansible-playbook -i ./inventory --skip-tags 'postfix drop' --private-key ${var.private_key} -e 'pub_key=${var.public_key}' playbook.yml"
  }

}
*/

# --------------- get static IP addresses ------------------

resource "aws_eip" "vm_static_ip" {
  instance = aws_instance.myvm[0].id
  vpc = true
  tags = { 
    Name = "Postfix Server IP" 
  }
}
