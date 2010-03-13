CREATE TABLE `days` (
  `id` int(11) NOT NULL auto_increment,
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
);

CREATE TABLE `thoughts` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `value` text,
  `created_at` timestamp NOT NULL default '0000-00-00 00:00:00',
  `day_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(80) default NULL,
  `password` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
);