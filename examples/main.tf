terraform {
  required_providers {
    zstack = {
      source  = "ZStack-Robot/zstack"
      version = "1.0.5"
    }
  }
}

provider "zstack" {
  host             = "1.x.x.x"   # ZStack 管理节点的 IP
  account_name     = "admin"         # 账户名称
  account_password = "xxxx"      # 账户密码
}


# 获取镜像
module "zstack_image" {
  source = "git::http://dev.zstack.io:9080/jiajian.chi/terraform-zstack-image.git"   # image module git repo

  providers = {
    zstack = zstack
  }

  create_image = false
  image_name   = "Ubuntu20.04_base"  # 指定镜像名称
}

# 创建虚拟机实例
module "zstack_instance" {
  source = "../"  

  name = "basic-instance"
  description           = "basic instance created by Terraform"
  instance_count        = 1
  image_uuid             = module.zstack_image.image_uuid  

  # 通过名称查询资源
  l3_network_name       = "test"
  instance_offering_name = "min"
}

output "instance_ids" {
  value = module.zstack_instance.instances[*].uuid  
}

output "instance_names" {
  value = module.zstack_instance.instances[*].name  
}

output "instance_ip_addresses" {
  value = module.zstack_instance.instance_ips
}

# 访问特定实例的IP地址
output "first_instance_ip" {
  value = module.zstack_instance.instance_ips[0]
}
