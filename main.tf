terraform {
  required_providers {
    zstack = {
      source  = "zstack-robot/zstack"
      version = "1.0.5"
    }
  }
}

locals {
  context = var.context
}



data "zstack_l3networks" "l3networks" {
  count = var.l3_network_name != null ? 1 : 0
  name  = var.l3_network_name
}

# 如果提供了计算规格名称，则查询计算规格
data "zstack_instance_offers" "offers" {
  count = var.instance_offering_name != null ? 1 : 0
  name  = var.instance_offering_name
}

locals {
  # 确保l3_network_uuids不为空
  l3_network_uuids = var.l3_network_name != "" ? [data.zstack_l3networks.l3networks[0].l3networks[0].uuid] : var.l3_network_uuids
  
  # 确保instance_offering_uuid不为空
  instance_offering_uuid = var.instance_offering_uuid != "" ? var.instance_offering_uuid : (
    try(data.zstack_instance_offers.offers[0].instance_offers[0].uuid, "")
  )
  
}


resource "zstack_instance" "instance" {
  count = var.instance_count

  name                   = var.instance_count > 1 ? "${var.name}-${count.index + 1}" : var.name
  description            = var.description
  image_uuid             = var.image_uuid
  instance_offering_uuid = local.instance_offering_uuid != "" ? local.instance_offering_uuid : null
  l3_network_uuids           = local.l3_network_uuids
}
