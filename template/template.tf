data "template_file" "bootstrap" {
  template = file("../lib/bootstrap.sh.tpl")  
  vars = {
    ssh_public_key = var.ssh_public_key
  }  
}