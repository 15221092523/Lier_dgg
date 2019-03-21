
#2018-06-04 修改表属性
ALTER TABLE `elsonic`.`biz_device_info`
CHANGE COLUMN `name` `name` VARCHAR(45) NULL COMMENT '设备名称' ,
CHANGE COLUMN `mode` `mode` VARCHAR(45) NULL COMMENT '设备型号' ,
CHANGE COLUMN `room_id` `room_id` INT(11) NULL COMMENT '房间ID' ;

#2018-06-11 添加设备的空间位置
ALTER TABLE `elsonic`.`biz_device_info`
  ADD COLUMN `site` INT(11) NULL COMMENT '空间位置' AFTER `create_time`;
