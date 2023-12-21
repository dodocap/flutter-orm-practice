import 'dart:math';

import 'package:orm_practice/23_12_21/model/youtube_item.dart';
import 'package:orm_practice/23_12_21/model/youtube_item_full.dart';
import 'package:orm_practice/23_12_21/model/youtube_item_short_group.dart';

class YoutubeItemRepository {
  Future<List<YoutubeItem>> getYoutubeItems() async {
    YoutubeItemShortGroup group1 = YoutubeItemShortGroup([
      YoutubeItemShort(
          thumbnailUrl: 'https://i.ytimg.com/vi/vndwHICSLHk/oardefault.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLDcGId8nxm5T39GKbfIPLkoPrlnaA',
          title: '간단해요 #소불고기',
          viewCount: '15만회'),
      YoutubeItemShort(
          thumbnailUrl: 'https://i.ytimg.com/vi/54bv7Tu26_M/oar2.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLAxNpzueYGWqLZ1t2D8WVKOzIrAuA',
          title: '자는 엄마 앞에서 군인으로 돌아가보기 #short',
          viewCount: '92만회'),
      YoutubeItemShort(
          thumbnailUrl: 'https://i.ytimg.com/vi/cAxjs2vhU5U/hq720_2.jpg?sqp=-oaymwEdCI4CEOADSFXyq4qpAw8IARUAAIhCcAHAAQbQAQE=&rs=AOn4CLA24Z8dwYfgn-TRlLhGbWifvie_bA',
          title: '말티즈는 참지않긔!',
          viewCount: '67만회'),
      YoutubeItemShort(
          thumbnailUrl: 'https://i.ytimg.com/vi/GTuDb4umtzE/oar2.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLCgoipUsIXgkvttYL6YFgy9oJUZBA',
          title: '시선 강타 알바생 (SUB)',
          viewCount: '173만회'),
    ])..list.shuffle();

    YoutubeItemShortGroup group2 = YoutubeItemShortGroup([
      YoutubeItemShort(
          thumbnailUrl: 'https://i.ytimg.com/vi/AmeI6ku4cY8/oardefault.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLCp3R0fa94tV4iTPiNh_wCNjDLt6Q',
          title: '신동엽이 장도연에게 해준 3가지 조언',
          viewCount: '3.2만회'),
      YoutubeItemShort(
          thumbnailUrl: 'https://i.ytimg.com/vi/cJ2jntQVWAI/oar2.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLDdg3gPuaSj-PxvGjnSK152vHiwrQ',
          title: '루돌프가 말을 한다!!',
          viewCount: '22만회'),
      YoutubeItemShort(
          thumbnailUrl: 'https://i.ytimg.com/vi/_eCFORsIqSA/oar2.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLCbFFTdnYiqNUEvsHe_GVU0_dP-ZQ',
          title: '예원이한테 안기고 싶은 신형사 #shorts',
          viewCount: '46만회'),
      YoutubeItemShort(
          thumbnailUrl: 'https://i.ytimg.com/vi/8T2SSZbgVdA/oardefault.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLCBASDa9s-djTD7_cE7fQK-4domCg',
          title: '성시경이 결혼하지 않기를 바라는 이소라',
          viewCount: '3.1만회'),
    ])..list.shuffle();

    final List<YoutubeItem> list = [
      YoutubeItemFull(
          thumbnailUrl: 'https://i.ytimg.com/vi/gR-wY76ZB8E/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLB3I-DOoni8LT1bTQHfb24m8G3lQA',
          creatorThumbnailUrl: 'https://yt3.ggpht.com/Q5NILve5GWBbdJV7lf6NArRHjvhd9ZoeTFWfbkPGB94jdrlQBw9xjciX3jrgJ1pjxh3wXFZIag=s68-c-k-c0x00ffffff-no-rj',
          title: '크리스마스',
          creator: '사우스 코리안 파크 South Korean Park',
          viewCount: '25만회',
          publishTime: '2시간 전'),
      YoutubeItemFull(
          thumbnailUrl: 'https://i.ytimg.com/vi/r588n-UzCas/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCC1AvVMisS7SNm_77FVtSu1awjPg',
          creatorThumbnailUrl: 'https://yt3.ggpht.com/1WNuE8XkEOSb1-aIXob8ut1YVYLnRWjKwYZAyK63PtmQJp3vYg_AqEwx413BzPPraTbrL62dcA=s68-c-k-c0x00ffffff-no-rj',
          title: '치지직은 어떤 플랫폼이 될까?',
          creator: '주말이',
          viewCount: '5만회',
          publishTime: '44분 전'),
      YoutubeItemFull(
          thumbnailUrl: 'https://i.ytimg.com/vi/blsIp2ikV6Q/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBD7maXNIZXcg4_jN55m8u3hE9pdQ',
          creatorThumbnailUrl: 'https://yt3.ggpht.com/ytc/AIf8zZSPMcPOvu4zv94J6BMf82VEyMgrBamu37VqgGsJ=s68-c-k-c0x00ffffff-no-rj',
          title: '[ENG SUB] [밥묵자] 에스파? 내는 배고파! (feat. 윈터, 지젤)',
          creator: '꼰대희',
          viewCount: '324만회',
          publishTime: '3주 전'),
      YoutubeItemFull(
          thumbnailUrl: 'https://i.ytimg.com/vi/qDBgV1o_l0w/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBzC90rPEe9nipyGIQutXb8KZ8USg',
          creatorThumbnailUrl: 'https://yt3.ggpht.com/ytc/AIf8zZSLHe1x4Mb_8YIWNjlVDqueTFYGFooTOLGOPhJ2=s68-c-k-c0x00ffffff-no-rj',
          title: '말티즈가 뒷발을 주는 이유?? #김둥배',
          creator: '김둥배',
          viewCount: '2.2천회',
          publishTime: '2개월 전'),
      YoutubeItemFull(
          thumbnailUrl: 'https://i.ytimg.com/vi/jcgBsG23KMA/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAkWNZDy4Ec6JhjKCBDnvrrlODMGw',
          creatorThumbnailUrl: 'https://yt3.ggpht.com/CWgslu2R6rulmunWqzkUy7zlYfh-eoY_RhCWqT2P23aMba21IwtbXAodsE3BEtYCr2tO80OK=s68-c-k-c0x00ffffff-no-rj',
          title: '''"손흥민은 PL최고"맨시티 에이스 로드리도 '극찬' #SPOTIME''',
          creator: '스포타임',
          viewCount: '7.6만회',
          publishTime: '4시간 전'),
      YoutubeItemFull(
          thumbnailUrl: 'https://i.ytimg.com/vi/qOoriac0Bbs/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBioAwTIv5DiElR7C9fCHdpVCYKkg',
          creatorThumbnailUrl: 'https://yt3.ggpht.com/ytc/AIf8zZSX6GtI20QiQjRi0t_d7XW7M6AcRRBiDffZGMrl=s88-c-k-c0x00ffffff-no-rj',
          title: '모두의연구소 오름캠프 Flutter 모바일 앱 과정 1기 안내',
          creator: '오준석의 생존코딩',
          viewCount: '100만회',
          publishTime: '1개월 전'),
    ]..shuffle();

    int index1 = Random().nextInt(list.length);
    while(true) {
      int index2 = Random().nextInt(list.length);

      int abs = (index1 - index2).abs();
      if(abs <= 1 || abs == list.length) {
        continue;
      }

      list.insert(index1, group1);
      list.insert(index2, group2);
      break;
    }

    await Future.delayed(const Duration(milliseconds: 500));

    return list;
  }
}
