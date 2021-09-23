
CREATE SCHEMA eudamed DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

CREATE TABLE IF NOT EXISTS mas_user (
  userid VARCHAR(20) NOT NULL,
  user_type VARCHAR(1) NULL,
  superid VARCHAR(20) NULL,
  email VARCHAR(50) NULL,
  cc_email VARCHAR(4000) NULL,
  first_name VARCHAR(40) NULL,
  last_name VARCHAR(40) NULL,
  phone_no VARCHAR(20) NULL,
  cell_no VARCHAR(20) NULL,
  city VARCHAR(40) NULL,
  state VARCHAR(40) NULL,
  country VARCHAR(2) NULL,
  organization VARCHAR(40) NULL,
  display VARCHAR(1) NULL,
  password VARCHAR(500) NULL,
  salt VARCHAR(200) NULL,
  create_date DATETIME NOT NULL,
  modified_date DATETIME NOT NULL,
  PRIMARY KEY (userid));

CREATE TABLE IF NOT EXISTS mas_config (
  userid VARCHAR(20) NOT NULL,
  account_type VARCHAR(1) NULL,
  language VARCHAR(2) NULL,
  theme VARCHAR(10) NULL,
  mail_host VARCHAR(20) NULL,
  mail_pwd VARCHAR(50) NULL,
  mail_username VARCHAR(30) NULL,
  mail_port VARCHAR(5) NULL,
  user_limit INT NULL DEFAULT 0,
  client_number INT NULL DEFAULT 0,
  create_date DATETIME NOT NULL,
  modified_date DATETIME NOT NULL,
  PRIMARY KEY (userid));
  
INSERT INTO mas_user (userid,user_type,superid,sub_userid,email,cc_email,first_name,last_name,phone_no,cell_no,city,state,country,organization,display,password,salt,create_date,modified_date) VALUES ('admin','A','admin',NULL,'vipinlal.tg@beo.in','vipinlal.tg@beo.in','BEO Park','BEO Software','0987456311','213154567897','Ernakulam','Kerala','IN','BEO','Y','111',NULL,'2021-02-24 10:10:10','2021-02-24 10:10:10');
INSERT INTO mas_config (userid,account_type,language,theme,mail_host,mail_pwd,mail_username,mail_port,user_limit,client_number,create_date,modified_date) VALUES ('admin',NULL,'EN','beo','email-smtp.eu-west-1.amazonaws.com','BJfvn5zzhc2g1BpMI4SRDwR7siNHicT1ekhDmOUVna2u','AKIA52GWXSQ6TKAIF5HH','587',0,0,'2021-02-24 10:10:10','2021-02-24 10:10:10');

CREATE TABLE number_generator (
  userid varchar(20) NOT NULL,
  msg_type varchar(3) NOT NULL,
  device_no int NOT NULL,
  PRIMARY KEY (userid, msg_type)
);

CREATE TABLE device_detail (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  basic_udi_di varchar(120) NOT NULL,
  userid varchar(20) NOT NULL,
  issue_code varchar(20) DEFAULT NULL,
  mf_actor varchar(15) DEFAULT NULL,
  legislation varchar(10) DEFAULT NULL,
  type varchar(15) DEFAULT NULL,
  special_device varchar(35) DEFAULT NULL,
  ar_actor varchar(15) DEFAULT NULL,
  risk_class varchar(25) DEFAULT NULL,
  animal_tissue varchar(5) DEFAULT NULL,
  device_model varchar(260) DEFAULT NULL,
  device_name varchar(260) DEFAULT NULL,
  human_tissue varchar(5) DEFAULT NULL,
  entity_state varchar(10) DEFAULT NULL,
  entity_version varchar(5) DEFAULT NULL,
  conversation_id varchar(40) DEFAULT NULL,
  correlation_id varchar(40) DEFAULT NULL,
  message_id varchar(40) DEFAULT NULL,
  m_action varchar(10) NOT NULL,
  display varchar(1) NOT NULL,
  create_date datetime NOT NULL,
  modified_date datetime NOT NULL,
  PRIMARY KEY (superid, device_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE device_header (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  n_actor_code varchar(20) DEFAULT NULL,
  node_id varchar(40) DEFAULT NULL,
  src_acs_tkn varchar(40) DEFAULT NULL,
  src_id varchar(40) DEFAULT NULL,
  src_operation varchar(40) DEFAULT NULL,
  src_version varchar(40) DEFAULT NULL,
  s_n_actor_code varchar(20) DEFAULT NULL,
  s_node_id varchar(40) DEFAULT NULL,
  s_src_id varchar(40) DEFAULT NULL,
  s_src_operation varchar(40) DEFAULT NULL,
  PRIMARY KEY (superid, device_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE mdr_basic (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  human_product varchar(5) DEFAULT NULL,
  medicianl_product varchar(5) DEFAULT NULL,
  implantable_exception varchar(5) DEFAULT NULL,
  active_device varchar(5) DEFAULT NULL,
  administer_medicine varchar(5) DEFAULT NULL,
  implantable varchar(5) DEFAULT NULL,
  measure_function varchar(5) DEFAULT NULL,
  reusable varchar(5) DEFAULT NULL,
  PRIMARY KEY (superid, device_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE ivdr_basic (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  microbial_sub varchar(5) DEFAULT NULL,
  companion_diagnostic varchar(5) DEFAULT NULL,
  near_patiant varchar(5) DEFAULT NULL,
  self_test varchar(5) DEFAULT NULL,
  reagent varchar(5) DEFAULT NULL,
  professional_test varchar(5) DEFAULT NULL,
  instrument varchar(5) DEFAULT NULL,
  kit varchar(5) DEFAULT NULL,
  PRIMARY KEY (superid, device_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE clinical_link (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  pos_num int NOT NULL,
  reference varchar(50) DEFAULT NULL,
  country varchar(2) DEFAULT NULL,
  version varchar(5) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE device_certificate_info (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  cert_type varchar(50) DEFAULT NULL,
  cert_number varchar(120) DEFAULT NULL,
  cert_revision_no varchar(120) DEFAULT NULL,
  actor_code varchar(15) DEFAULT NULL,
  PRIMARY KEY (superid, device_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE cerificate_information (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  pos_num int NOT NULL,
  cert_number varchar(120) DEFAULT NULL,
  cert_revision_no varchar(120) DEFAULT NULL,
  issue_date varchar(10) DEFAULT NULL,
  validity_date varchar(10) DEFAULT NULL,
  expiry_date varchar(10) DEFAULT NULL,
  acrot_code varchar(15) DEFAULT NULL,
  cert_status varchar(30) DEFAULT NULL,
  cert_type varchar(50) DEFAULT NULL,
  decision_date varchar(10) DEFAULT NULL,
  decision_applic_date varchar(10) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE device_udi_di (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  udi_issue_code varchar(20) DEFAULT NULL,
  basic_di_code varchar(120) NOT NULL,
  basic_issue_code varchar(20) DEFAULT NULL,
  sec_di_code varchar(120) DEFAULT NULL,
  sec_issue_code varchar(20) DEFAULT NULL,
  unit_di_code varchar(120) DEFAULT NULL,
  unit_issue_code varchar(20) DEFAULT NULL,
  d_mrkt_di_code varchar(120) DEFAULT NULL,
  d_mrkt_issue_code varchar(20) DEFAULT NULL,
  base_quantity int NOT NULL,
  dev_direct_marked varchar(5) DEFAULT NULL,
  latex varchar(5) DEFAULT NULL,
  number_of_reuses int DEFAULT NULL,
  new_device varchar(5) DEFAULT NULL,
  reference_number varchar(120) DEFAULT NULL,
  re_processed varchar(5) DEFAULT NULL,
  single_user varchar(5) DEFAULT NULL,
  sterile varchar(5) DEFAULT NULL,
  sterilization varchar(5) DEFAULT NULL,
  website varchar(500) DEFAULT NULL,
  device_status varchar(35) DEFAULT NULL,
  country varchar(2) DEFAULT NULL,
  prod_identifiers varchar(25) DEFAULT NULL,
  mdn_code varchar(10) DEFAULT NULL,
  related_di_code varchar(120) DEFAULT NULL,
  related_issue_code varchar(20) DEFAULT NULL,
  relation_type varchar(30) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE cmr_substance (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  cmr_type varchar(10) DEFAULT NULL,
  cmr_name varchar(2000) DEFAULT NULL,
  cmr_lang varchar(2) DEFAULT NULL,
  cas_code varchar(12) DEFAULT NULL,
  ec_code varchar(9) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE endocrine_substance (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  crine_name varchar(2000) DEFAULT NULL,
  crine_lang varchar(2) DEFAULT NULL,
  cas_code varchar(12) DEFAULT NULL,
  ec_code varchar(9) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE medicinal_product_substance (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  med_type varchar(20) DEFAULT NULL,
  med_name varchar(2000) DEFAULT NULL,
  med_lang varchar(2) DEFAULT NULL,
  med_inn varchar(2000) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE annex_non_medical_device (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  med_dev_typ varchar(30) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE device_sub_status (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  recall_prec varchar(2000) DEFAULT NULL,
  recall_prec_lang varchar(2) DEFAULT NULL,
  recall_scope varchar(20) DEFAULT NULL,
  sub_start_date varchar(10) DEFAULT NULL,
  sub_end_date varchar(10) DEFAULT NULL,
  sub_status_code varchar(40) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE additional_description (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  description varchar(2000) DEFAULT NULL,
  language varchar(3) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE trade_name (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  trade_name varchar(255) DEFAULT NULL,
  language varchar(3) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE storage_handling (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  cond_value varchar(8) DEFAULT NULL,
  comment varchar(2000) DEFAULT NULL,
  language varchar(3) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE critical_warnings (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  warning_value varchar(5) DEFAULT NULL,
  comment varchar(2000) DEFAULT NULL,
  language varchar(3) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE clinical_size (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  cl_type varchar(5) DEFAULT NULL,
  maximum_size DECIMAL DEFAULT NULL,
  cl_precision varchar(5) DEFAULT NULL,
  minimum_size DECIMAL DEFAULT NULL,
  clinical_value DECIMAL DEFAULT NULL,
  value_text varchar(255) DEFAULT NULL,
  value_unit varchar(5) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE market_info (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  start_date varchar(10) DEFAULT NULL,
  end_date varchar(10) DEFAULT NULL,
  country varchar(3) DEFAULT NULL,
  version varchar(5) DEFAULT NULL,
  placed_mrkt varchar(5) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE contained_item (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  pos_num int NOT NULL,
  di_code varchar(120) DEFAULT NULL,
  issue_code varchar(20) DEFAULT NULL,
  items int DEFAULT NULL,
  child_di_code varchar(120) DEFAULT NULL,
  child_issue_code varchar(20) DEFAULT NULL,
  pckg_code varchar(35) DEFAULT NULL,
  version varchar(5) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code, pos_num)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE product_designer_link (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  udi_di_code varchar(120) NOT NULL,
  actor_code varchar(15) DEFAULT NULL,
  orga_name varchar(255) DEFAULT NULL,
  language varchar(3) DEFAULT NULL,
  PRIMARY KEY (superid, device_id, udi_di_code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE submission_status (
  superid varchar(20) NOT NULL,
  device_id varchar(20) NOT NULL,
  basic_udi_di varchar(120) NOT NULL,
  issue_entity varchar(20) NOT NULL,
  userid varchar(20) DEFAULT NULL,
  status varchar(10) DEFAULT NULL,
  manufacturer varchar(15) DEFAULT NULL,
  display varchar(1) DEFAULT NULL,
  create_date DATETIME NOT NULL,
  modified_date DATETIME NOT NULL,
  PRIMARY KEY (superid, device_id, basic_udi_di)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE submission_log (
  id int NOT NULL AUTO_INCREMENT,
  device_id varchar(20) DEFAULT NULL,
  basic_udi_di varchar(120) DEFAULT NULL,
  issue_entity varchar(20) DEFAULT NULL,
  superid varchar(20) DEFAULT NULL,
  userid varchar(20) DEFAULT NULL,
  m_action varchar(10) DEFAULT NULL,
  file_name varchar(500) DEFAULT NULL,
  manufacturer varchar(15) DEFAULT NULL,
  receive_id varchar(120) DEFAULT NULL,
  create_date DATETIME NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE file_interface (
  id int NOT NULL AUTO_INCREMENT,
  superid varchar(20) DEFAULT NULL,
  userid varchar(20) DEFAULT NULL,
  device_id varchar(20) DEFAULT NULL,
  basic_udi_di varchar(120) DEFAULT NULL,
  issue_entity varchar(20) DEFAULT NULL,
  file_name varchar(500) DEFAULT NULL,
  file_path varchar(4000) DEFAULT NULL,
  create_date DATETIME NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



drop table device_detail;
drop table device_header;
drop table mdr_basic;
drop table ivdr_basic;
drop table clinical_link;
drop table device_certificate_info;
drop table cerificate_information;
drop table device_udi_di;
drop table cmr_substance;
drop table endocrine_substance;
drop table medicinal_product_substance;
drop table annex_non_medical_device;
drop table device_sub_status;
drop table additional_description;
drop table trade_name;
drop table storage_handling;
drop table critical_warnings;
drop table clinical_size;
drop table market_info;
drop table contained_item;
drop table product_designer_link;