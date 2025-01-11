locals {
    #just key value pairs which supports functions and runtime executables.
    key_name_public   =   file("${path.module}/devops.pub")
    instance_type   = var.prod_env ? "t3.micro"  :   "t3.medium"
}