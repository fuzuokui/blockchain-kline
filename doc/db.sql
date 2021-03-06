-- 菜单
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) COMMENT '菜单名称',
  `url` varchar(200) COMMENT '菜单URL',
  `perms` varchar(500) COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) COMMENT '菜单图标',
  `order_num` int COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- 系统用户
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) COMMENT '密码',
  `email` varchar(100) COMMENT '邮箱',
  `mobile` varchar(100) COMMENT '手机号',
  `status` tinyint COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- 角色
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) COMMENT '角色名称',
  `remark` varchar(100) COMMENT '备注',
  `create_time` datetime COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- 用户与角色对应关系
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint COMMENT '用户ID',
  `role_id` bigint COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- 角色与菜单对应关系
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint COMMENT '角色ID',
  `menu_id` bigint COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- 初始数据
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `email`, `mobile`, `status`, `create_time`) VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'root@renren.io', '13612345678', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('1', '0', '系统管理', NULL, NULL, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('2', '1', '管理员列表', 'sys/user.html', 'sys:user:list,sys:user:info,sys:user:save,sys:user:update,sys:user:delete,sys:role:select', '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('3', '1', '角色管理', 'sys/role.html', 'sys:role:list,sys:role:info,sys:role:save,sys:role:update,sys:role:delete,sys:menu:perms', '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('4', '1', '菜单管理', 'sys/menu.html', 'sys:menu:list,sys:menu:select,sys:menu:info,sys:menu:save,sys:menu:update,sys:menu:delete', '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('5', '1', 'SQL监控', 'druid/sql.html', NULL, '1', 'fa fa-bug', '4');


-- 操作日志表
CREATE TABLE `sys_admin_opt_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL COMMENT '管理员ID',
  `request_uri` varchar(255)  DEFAULT NULL COMMENT '请求的接口',
  `request_params` varchar(500)  DEFAULT NULL COMMENT '请求参数',
  `response_result` varchar(2000)  DEFAULT NULL COMMENT '响应结果',
  `opt_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `client_ip` varchar(255)  DEFAULT NULL COMMENT '客户端IP',
  PRIMARY KEY (`id`),
  KEY `ADMIN_OPTLOG_AID_IDX` (`admin_id`) USING BTREE,
  KEY `ADMIN_OPTLOG_AID_OPTIME_IDX` (`opt_time`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  COMMENT='管理员操作日志表';



CREATE TABLE `bc_eos_common_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_datetime` datetime NOT NULL COMMENT '统计时间',
  `price` bigint(20) DEFAULT '0' COMMENT 'RMB价格(单位分)',
  `data_source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`),
  KEY `idx_data_datetime` (`data_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=2762 DEFAULT CHARSET=utf8 COMMENT='EOS普通数据表';


CREATE TABLE `bc_eth_common_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_datetime` datetime NOT NULL COMMENT '统计时间',
  `price` bigint(20) DEFAULT '0' COMMENT 'RMB价格(单位分)',
  `data_source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`),
  KEY `idx_data_datetime` (`data_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='ETH普通数据表';


CREATE TABLE `bc_btc_common_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_datetime` datetime NOT NULL COMMENT '统计时间',
  `price` bigint(20) DEFAULT '0' COMMENT 'RMB价格(单位分)',
  `data_source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`),
  KEY `idx_data_datetime` (`data_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='BTC普通数据表';

CREATE TABLE `bc_ltc_common_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_datetime` datetime NOT NULL COMMENT '统计时间',
  `price` bigint(20) DEFAULT '0' COMMENT 'RMB价格(单位分)',
  `data_source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`),
  KEY `idx_data_datetime` (`data_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='LTC普通数据表';

CREATE TABLE `bc_rxp_common_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_datetime` datetime NOT NULL COMMENT '统计时间',
  `price` bigint(20) DEFAULT '0' COMMENT 'RMB价格(单位分)',
  `data_source` varchar(32) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`),
  KEY `idx_data_datetime` (`data_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='RXP普通数据表';
