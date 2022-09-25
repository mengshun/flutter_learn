import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/group/MSGroupPage.dart';
import 'package:learn_flutter/douban/pages/main/bottom_bar_item.dart';
import 'package:learn_flutter/douban/pages/mall/MSMallPage.dart';
import 'package:learn_flutter/douban/pages/profile/MSProfilePage.dart';

import '../home/home.dart';
import '../subject/MSSubjectPage.dart';

List<MSTabbarItem> items = [
  MSTabbarItem(icon: Icons.home, title: "首页"),
  MSTabbarItem(icon: Icons.video_call, title: "书影音"),
  MSTabbarItem(icon: Icons.group, title: "小组"),
  MSTabbarItem(icon: Icons.join_inner, title: "市集"),
  MSTabbarItem(icon: Icons.person, title: "我的"),
];

List<Widget> pages = [
  MSHomePage(),
  MSSubjectPage(),
  MSGroupPage(),
  MSMallPage(),
  MSProfilePage(),
];
