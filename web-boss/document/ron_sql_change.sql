-- 用户与群组关系为一对多关系,用户添加群组ID.并删除中间表  20180530
ALTER TABLE `elsonic`.`biz_user_info`
ADD COLUMN `group_id` INT NULL AFTER `distance`;
ALTER TABLE `elsonic`.`biz_user_info`
CHANGE COLUMN `group_id` `group_id` INT(11) NULL DEFAULT 1 ;

drop table biz_group_user;

-- 用户表添加字段
ALTER TABLE `elsonic`.`biz_user_info`
ADD COLUMN `status` TINYINT NULL DEFAULT 0 AFTER `group_id`;

ALTER TABLE `elsonic`.`biz_user_info`
CHANGE COLUMN `status` `status` TINYINT(4) NULL DEFAULT '0' COMMENT '0  冻结 1 激活' ;

ALTER TABLE `elsonic`.`biz_feedback_info`
CHANGE COLUMN `description` `description` VARCHAR(300) NULL DEFAULT NULL COMMENT '描述' ,
CHANGE COLUMN `type` `type` TINYINT(2) NULL DEFAULT NULL COMMENT '类型' ,
CHANGE COLUMN `status` `status` TINYINT(2) NULL DEFAULT NULL COMMENT '状态 0 未处理 1已处理' ,
ADD COLUMN `user_id` INT NULL AFTER `create_time`;

ALTER TABLE `elsonic`.`biz_feedback_info`
CHANGE COLUMN `create_time` `create_time` INT(11) NULL DEFAULT NULL ;

ALTER TABLE `elsonic`.`biz_device_info`
ADD UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC);

ALTER TABLE `elsonic`.`biz_room_info`
CHANGE COLUMN `house_id` `house_id` INT NULL DEFAULT NULL COMMENT '房子ID' ;

ALTER TABLE `elsonic`.`biz_model_info`
ADD COLUMN `ename` VARCHAR(45) NULL AFTER `create_time`,
ADD COLUMN `code` VARCHAR(45) NULL AFTER `ename`;

ALTER TABLE `elsonic`.`biz_device_model`
ADD COLUMN `type` INT NULL COMMENT '1 空调 2地暖 3 新风' AFTER `value`;

ALTER TABLE `elsonic`.`biz_device_model`
CHANGE COLUMN `value` `value` VARCHAR(45) NOT NULL COMMENT '设置值' ;

ALTER TABLE `elsonic`.`biz_curve_system`
ADD COLUMN `code` VARCHAR(45) NULL AFTER `curve_type`;

ALTER TABLE `elsonic`.`biz_curve_system`
CHANGE COLUMN `name` `cn_name` VARCHAR(45) NULL DEFAULT NULL COMMENT '设备名称' ,
ADD COLUMN `eg_name` VARCHAR(45) NULL AFTER `code`;

ALTER TABLE `elsonic`.`biz_curve_system`
CHANGE COLUMN `value` `value` VARCHAR(150) NULL DEFAULT NULL COMMENT '曲线值' ;

ALTER TABLE `elsonic`.`biz_device_info`
CHANGE COLUMN `work_state` `work_model` SMALLINT(1) NULL DEFAULT NULL COMMENT '工作模式\n针对空调\r\n0：制冷 \r\n1：除湿 \r\n2：送风  \r\n3：制热 \r\n4：自动' ;

ALTER TABLE `elsonic`.`biz_curve_custom`
CHANGE COLUMN `value` `value` VARCHAR(150) NULL DEFAULT NULL ;

//用户信息表
CREATE TABLE `biz_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//房子环境表
CREATE TABLE `elsonic`.`biz_house_conditions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `house_id` INT NULL,
  `room_temp` VARCHAR(45) NULL COMMENT '房间温度',
  `room_humidity` VARCHAR(45) NULL COMMENT '房内湿度',
  `room_pm25` VARCHAR(45) NULL COMMENT '房内pm2.5',
  `room_tvoc` VARCHAR(45) NULL COMMENT '房间甲醛',
  `last_time` INT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`));

ALTER TABLE `elsonic`.`biz_house_conditions`
ADD UNIQUE INDEX `house_id_UNIQUE` (`house_id` ASC);

ALTER TABLE `elsonic`.`biz_curve_custom`
CHANGE COLUMN `mac_address` `mac_address` VARCHAR(45) NOT NULL COMMENT '设备mac' ;

//是否已读
ALTER TABLE `elsonic`.`biz_message`
ADD COLUMN `is_read` TINYINT NULL AFTER `create_time`;

//pm2.5历史表
CREATE TABLE `elsonic`.`biz_pm25_history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mac_address` VARCHAR(60) NULL,
  `environment_type` INT NULL COMMENT '0室外，1卧室，2老人房，3客厅',
  `pm25` VARCHAR(150) NULL,
  `room_id` INT NULL,
  `update_time` INT NULL,
  `create_date` INT NULL,
  PRIMARY KEY (`id`));


ALTER TABLE `elsonic`.`biz_device_info`
ADD COLUMN `in_pm25` FLOAT NULL AFTER `site`,
ADD COLUMN `in_temp` FLOAT NULL AFTER `in_pm25`;

ALTER TABLE `elsonic`.`biz_device_info`
CHANGE COLUMN `wind_speed` `wind_speed` SMALLINT(1) NULL DEFAULT 0 COMMENT '0:高；\r\n1:中；\r\n2:低；\r\n3:自动(默认)' ,
CHANGE COLUMN `hcho` `hcho` FLOAT NULL DEFAULT 0 COMMENT '甲醛' ,
CHANGE COLUMN `out_pm25` `out_pm25` FLOAT NULL DEFAULT 0 COMMENT '室外pm2.5' ,
CHANGE COLUMN `out_temp` `out_temp` FLOAT NULL DEFAULT 0 ,
CHANGE COLUMN `out_humidity` `out_humidity` FLOAT NULL DEFAULT 0 COMMENT '室外湿度' ,
CHANGE COLUMN `in_pm25` `in_pm25` FLOAT NULL DEFAULT 0 ,
CHANGE COLUMN `in_temp` `in_temp` FLOAT NULL DEFAULT 0 ,
ADD COLUMN `set_temp` FLOAT NULL DEFAULT 0 AFTER `in_temp`;


ALTER TABLE `elsonic`.`biz_device_info`
ADD COLUMN `order_code` VARCHAR(45) NULL AFTER `set_temp`;






