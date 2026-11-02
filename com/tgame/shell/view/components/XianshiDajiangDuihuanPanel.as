package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.gift.XianShiDaJiangDuiHuanCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class XianshiDajiangDuihuanPanel extends FPanel
   {
      
      public static const UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW:String = "UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW";
      
      public static const UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DUIHUAN_SHOW:String = "UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DUIHUAN_SHOW";
      
      public static const UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU:String = "UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU";
      
      public static const UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_GOUMAI:String = "UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_GOUMAI";
      
      public static const UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DAKAI_MIANBAN:String = "UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DAKAI_MIANBAN";
      
      private var xianshiduihuan:XianShiDaJiangDuiHuanCanvas;
      
      public var tabBar:FTabBar;
      
      public function XianshiDajiangDuihuanPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 610 + 120 + 25;
         height = 441 + 77;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.xianshiduihuan = new XianShiDaJiangDuiHuanCanvas();
         this.xianshiduihuan.$parent = this;
         addChild(this.xianshiduihuan);
         this.xianshiduihuan.x = 10;
         this.xianshiduihuan.y = 22;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("永久活动2"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("万宝积分兑换"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent = null, param2:String = "") : void
      {
         var _loc3_:String = "";
         if(param1 == null)
         {
            _loc3_ = param2;
         }
         else
         {
            _loc3_ = (param1.target as FButton).label;
         }
         switch(_loc3_)
         {
            case LanResManager.getLanCommonTextWords("限时大奖兑换"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",1));
               break;
            case LanResManager.getLanCommonTextWords("巅峰兽活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",24));
               break;
            case LanResManager.getLanCommonTextWords("永久活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",2));
               break;
            case LanResManager.getLanCommonTextWords("勋章活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",3));
               break;
            case LanResManager.getLanCommonTextWords("功法活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",4));
               break;
            case LanResManager.getLanCommonTextWords("装备活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",5));
               break;
            case LanResManager.getLanCommonTextWords("高级装备"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",6));
               break;
            case LanResManager.getLanCommonTextWords("新手活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",20));
               break;
            case LanResManager.getLanCommonTextWords("特殊活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",21));
               break;
            case LanResManager.getLanCommonTextWords("武林神兵"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",22));
               break;
            case LanResManager.getLanCommonTextWords("金身"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",23));
               break;
            case LanResManager.getLanCommonTextWords("三八活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",25));
               break;
            case LanResManager.getLanCommonTextWords("情人节玫瑰"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",26));
               break;
            case LanResManager.getLanCommonTextWords("永久活动3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",27));
               break;
            case LanResManager.getLanCommonTextWords("玄说矿石"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",28));
               break;
            case LanResManager.getLanCommonTextWords("神兵不可思议"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",29));
               break;
            case LanResManager.getLanCommonTextWords("傲神神龙"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",30));
               break;
            case LanResManager.getLanCommonTextWords("锻打神器"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",31));
               break;
            case LanResManager.getLanCommonTextWords("王者武装"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",32));
               break;
            case LanResManager.getLanCommonTextWords("血风"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",33));
               break;
            case LanResManager.getLanCommonTextWords("雄王活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",34));
               break;
            case LanResManager.getLanCommonTextWords("显赫战功"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",35));
               break;
            case LanResManager.getLanCommonTextWords("解放日活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",36));
               break;
            case LanResManager.getLanCommonTextWords("五一活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",37));
               break;
            case LanResManager.getLanCommonTextWords("优惠活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",38));
               break;
            case LanResManager.getLanCommonTextWords("超级强化"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",40));
               break;
            case LanResManager.getLanCommonTextWords("519优惠"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",41));
               break;
            case LanResManager.getLanCommonTextWords("降龙护体"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",42));
               break;
            case LanResManager.getLanCommonTextWords("欧洲足球"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",43));
               break;
            case LanResManager.getLanCommonTextWords("儿童节活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",44));
               break;
            case LanResManager.getLanCommonTextWords("儿童节称号"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",45));
               break;
            case LanResManager.getLanCommonTextWords("61活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",46));
               break;
            case LanResManager.getLanCommonTextWords("欧洲足球2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",47));
               break;
            case LanResManager.getLanCommonTextWords("灭蜜蜂"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",48));
               break;
            case LanResManager.getLanCommonTextWords("端午节"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",49));
               break;
            case LanResManager.getLanCommonTextWords("毕方出世"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",50));
               break;
            case LanResManager.getLanCommonTextWords("每天优惠2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",51));
               break;
            case LanResManager.getLanCommonTextWords("超级强化2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",52));
               break;
            case LanResManager.getLanCommonTextWords("2016足球"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",53));
               break;
            case LanResManager.getLanCommonTextWords("旗色衣色"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",54));
               break;
            case LanResManager.getLanCommonTextWords("知恩"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",55));
               break;
            case LanResManager.getLanCommonTextWords("追龙血杀"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",56));
               break;
            case LanResManager.getLanCommonTextWords("龙晶之宝"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",57));
               break;
            case LanResManager.getLanCommonTextWords("争斗"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",58));
               break;
            case LanResManager.getLanCommonTextWords("武装互助"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",59));
               break;
            case LanResManager.getLanCommonTextWords("开战"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",60));
               break;
            case LanResManager.getLanCommonTextWords("王帮"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",61));
               break;
            case LanResManager.getLanCommonTextWords("送满心爱"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",62));
               break;
            case LanResManager.getLanCommonTextWords("夏天快乐"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",63));
               break;
            case LanResManager.getLanCommonTextWords("恍如隔世"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",64));
               break;
            case LanResManager.getLanCommonTextWords("四灵大战"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",65));
               break;
            case LanResManager.getLanCommonTextWords("打造神兵"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",66));
               break;
            case LanResManager.getLanCommonTextWords("天定魂魄"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",67));
               break;
            case LanResManager.getLanCommonTextWords("龙晶礼包"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",68));
               break;
            case LanResManager.getLanCommonTextWords("总决赛兑换"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",69));
               break;
            case LanResManager.getLanCommonTextWords("高手无双"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",70));
               break;
            case LanResManager.getLanCommonTextWords("圣战士"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",71));
               break;
            case LanResManager.getLanCommonTextWords("烈火圣蝎"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",72));
               break;
            case LanResManager.getLanCommonTextWords("五绝功法"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",74));
               break;
            case LanResManager.getLanCommonTextWords("神秘礼物"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",75));
               break;
            case LanResManager.getLanCommonTextWords("魂牵梦"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",76));
               break;
            case LanResManager.getLanCommonTextWords("乐心出击"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",77));
               break;
            case LanResManager.getLanCommonTextWords("周一活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",78));
               break;
            case LanResManager.getLanCommonTextWords("周二活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",79));
               break;
            case LanResManager.getLanCommonTextWords("周三活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",80));
               break;
            case LanResManager.getLanCommonTextWords("周四活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",81));
               break;
            case LanResManager.getLanCommonTextWords("周五活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",82));
               break;
            case LanResManager.getLanCommonTextWords("周六活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",83));
               break;
            case LanResManager.getLanCommonTextWords("周日活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",84));
               break;
            case LanResManager.getLanCommonTextWords("每日优惠3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",85));
               break;
            case LanResManager.getLanCommonTextWords("盂兰盒节"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",86));
               break;
            case LanResManager.getLanCommonTextWords("精髓东霞"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",87));
               break;
            case LanResManager.getLanCommonTextWords("开真元"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",88));
               break;
            case LanResManager.getLanCommonTextWords("七子全真教"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",89));
               break;
            case LanResManager.getLanCommonTextWords("八月底"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",90));
               break;
            case LanResManager.getLanCommonTextWords("降龙晶"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",91));
               break;
            case LanResManager.getLanCommonTextWords("七剑英雄"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",92));
               break;
            case LanResManager.getLanCommonTextWords("国庆活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",93));
               break;
            case LanResManager.getLanCommonTextWords("襄阳月色"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",94));
               break;
            case LanResManager.getLanCommonTextWords("群英取回"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",99));
               break;
            case LanResManager.getLanCommonTextWords("武神"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",100));
               break;
            case LanResManager.getLanCommonTextWords("西川红棉白花袍"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",101));
               break;
            case LanResManager.getLanCommonTextWords("神秘礼包"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",102));
               break;
            case LanResManager.getLanCommonTextWords("开真元2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",103));
               break;
            case LanResManager.getLanCommonTextWords("开真元3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",172));
               break;
            case LanResManager.getLanCommonTextWords("夏天快乐2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",104));
               break;
            case LanResManager.getLanCommonTextWords("夏天快乐3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",159));
               break;
            case LanResManager.getLanCommonTextWords("夏天快乐4"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",160));
               break;
            case LanResManager.getLanCommonTextWords("王者争雄"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",105));
               break;
            case LanResManager.getLanCommonTextWords("终极坐骑神丹"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",106));
               break;
            case LanResManager.getLanCommonTextWords("坐骑赔偿"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",107));
               break;
            case LanResManager.getLanCommonTextWords("强化之神2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",108));
               break;
            case LanResManager.getLanCommonTextWords("王帮出战"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",109));
               break;
            case LanResManager.getLanCommonTextWords("维系礼包"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",110));
               break;
            case LanResManager.getLanCommonTextWords("九月底"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",111));
               break;
            case LanResManager.getLanCommonTextWords("穷尽战意"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",112));
               break;
            case LanResManager.getLanCommonTextWords("强化之神3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",113));
               break;
            case LanResManager.getLanCommonTextWords("强化之神4"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",114));
               break;
            case LanResManager.getLanCommonTextWords("武神2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",115));
               break;
            case LanResManager.getLanCommonTextWords("龙晶2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",116));
               break;
            case LanResManager.getLanCommonTextWords("终极坐骑神丹2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",117));
               break;
            case LanResManager.getLanCommonTextWords("四龙天爪"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",118));
               break;
            case LanResManager.getLanCommonTextWords("五色朵花"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",119));
               break;
            case LanResManager.getLanCommonTextWords("越南妇女节"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",120));
               break;
            case LanResManager.getLanCommonTextWords("龙魂"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",121));
               break;
            case LanResManager.getLanCommonTextWords("龙魂2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",164));
               break;
            case LanResManager.getLanCommonTextWords("龙魂3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",165));
               break;
            case LanResManager.getLanCommonTextWords("战绩飘荡"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",122));
               break;
            case LanResManager.getLanCommonTextWords("傲剑五年"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",123));
               break;
            case LanResManager.getLanCommonTextWords("天马剑"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",124));
               break;
            case LanResManager.getLanCommonTextWords("五年之梦"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",125));
               break;
            case LanResManager.getLanCommonTextWords("五年之恩"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",126));
               break;
            case LanResManager.getLanCommonTextWords("甜蜜蛋糕"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",127));
               break;
            case LanResManager.getLanCommonTextWords("无尽快乐"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",128));
               break;
            case LanResManager.getLanCommonTextWords("八怪武神盾"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",129));
               break;
            case LanResManager.getLanCommonTextWords("突破武功"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",130));
               break;
            case LanResManager.getLanCommonTextWords("六脉剑"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",131));
               break;
            case LanResManager.getLanCommonTextWords("寻师学道"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",132));
               break;
            case LanResManager.getLanCommonTextWords("一大尊师"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",133));
               break;
            case LanResManager.getLanCommonTextWords("王者"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",134));
               break;
            case LanResManager.getLanCommonTextWords("武魂剑"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",136));
               break;
            case LanResManager.getLanCommonTextWords("顶峰神兽"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",137));
               break;
            case LanResManager.getLanCommonTextWords("天象王者"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",138));
               break;
            case LanResManager.getLanCommonTextWords("七色葫芦"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",139));
               break;
            case LanResManager.getLanCommonTextWords("伴随足球队"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",140));
               break;
            case LanResManager.getLanCommonTextWords("震天神器"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",141));
               break;
            case LanResManager.getLanCommonTextWords("龙晶章"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",142));
               break;
            case LanResManager.getLanCommonTextWords("飞龙晶"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",143));
               break;
            case LanResManager.getLanCommonTextWords("飞龙晶2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",170));
               break;
            case LanResManager.getLanCommonTextWords("飞龙晶3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",171));
               break;
            case LanResManager.getLanCommonTextWords("半决赛领奖"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",144));
               break;
            case LanResManager.getLanCommonTextWords("寻找宝藏"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",145));
               break;
            case LanResManager.getLanCommonTextWords("惊喜金票大奖"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",146));
               break;
            case LanResManager.getLanCommonTextWords("震天戟"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",147));
               break;
            case LanResManager.getLanCommonTextWords("华山五章"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",148));
               break;
            case LanResManager.getLanCommonTextWords("天雪神兵"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",149));
               break;
            case LanResManager.getLanCommonTextWords("桃花酒"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",150));
               break;
            case LanResManager.getLanCommonTextWords("桃花酒2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",162));
               break;
            case LanResManager.getLanCommonTextWords("桃花酒3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",163));
               break;
            case LanResManager.getLanCommonTextWords("开春万福"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",151));
               break;
            case LanResManager.getLanCommonTextWords("新年礼包"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",152));
               break;
            case LanResManager.getLanCommonTextWords("降龙超级"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",153));
               break;
            case LanResManager.getLanCommonTextWords("降龙超级2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",166));
               break;
            case LanResManager.getLanCommonTextWords("降龙超级3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",167));
               break;
            case LanResManager.getLanCommonTextWords("腾天羽"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",154));
               break;
            case LanResManager.getLanCommonTextWords("腾天羽2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",161));
               break;
            case LanResManager.getLanCommonTextWords("威勇无双"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",155));
               break;
            case LanResManager.getLanCommonTextWords("无尽金锭日"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",156));
               break;
            case LanResManager.getLanCommonTextWords("无尽金锭日2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",168));
               break;
            case LanResManager.getLanCommonTextWords("无尽金锭日3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",169));
               break;
            case LanResManager.getLanCommonTextWords("雄鸡权"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",157));
               break;
            case LanResManager.getLanCommonTextWords("春节对联"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",158));
               break;
            case LanResManager.getLanCommonTextWords("盖世神龙"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",173));
               break;
            case LanResManager.getLanCommonTextWords("姑姑成亲"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",174));
               break;
            case LanResManager.getLanCommonTextWords("天玉蟾"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",175));
               break;
            case LanResManager.getLanCommonTextWords("天神石"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",176));
               break;
            case LanResManager.getLanCommonTextWords("七星装备"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",177));
               break;
            case LanResManager.getLanCommonTextWords("灵丹珍品1"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",178));
               break;
            case LanResManager.getLanCommonTextWords("灵丹珍品2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",179));
               break;
            case LanResManager.getLanCommonTextWords("灵丹珍品3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",180));
               break;
            case LanResManager.getLanCommonTextWords("2月底"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",181));
               break;
            case LanResManager.getLanCommonTextWords("襄阳对决1"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",182));
               break;
            case LanResManager.getLanCommonTextWords("襄阳对决2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",183));
               break;
            case LanResManager.getLanCommonTextWords("无尽剑"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",184));
               break;
            case LanResManager.getLanCommonTextWords("英雄除暴"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",185));
               break;
            case LanResManager.getLanCommonTextWords("襄阳对决3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",186));
               break;
            case LanResManager.getLanCommonTextWords("无毒圣阵"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",187));
               break;
            case LanResManager.getLanCommonTextWords("绝世佳人1"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",188));
               break;
            case LanResManager.getLanCommonTextWords("绝世佳人2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",189));
               break;
            case LanResManager.getLanCommonTextWords("绝世佳人3"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",190));
               break;
            case LanResManager.getLanCommonTextWords("爱情糖果"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",191));
               break;
            case LanResManager.getLanCommonTextWords("中原保镖"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",192));
               break;
            case LanResManager.getLanCommonTextWords("天道"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",193));
               break;
            case LanResManager.getLanCommonTextWords("追寻降龙"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",194));
               break;
            case LanResManager.getLanCommonTextWords("3月底"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",195));
               break;
            case LanResManager.getLanCommonTextWords("圣火"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",196));
               break;
            case LanResManager.getLanCommonTextWords("神风"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",197));
               break;
            case LanResManager.getLanCommonTextWords("武林至宝"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",198));
               break;
            case LanResManager.getLanCommonTextWords("第五次王者之帮"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",199));
               break;
            case LanResManager.getLanCommonTextWords("不灭朱雀"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",200));
               break;
            case LanResManager.getLanCommonTextWords("精英聚会"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",201));
               break;
            case LanResManager.getLanCommonTextWords("全龙"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",202));
               break;
            case LanResManager.getLanCommonTextWords("武林秘籍"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",203));
               break;
            case LanResManager.getLanCommonTextWords("四月底"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",204));
               break;
            case LanResManager.getLanCommonTextWords("战神中原"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",205));
               break;
            case LanResManager.getLanCommonTextWords("大节优惠"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",206));
               break;
            case LanResManager.getLanCommonTextWords("武林大战"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",207));
               break;
            case LanResManager.getLanCommonTextWords("万毒灵"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",208));
               break;
            case LanResManager.getLanCommonTextWords("江湖论武"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",209));
               break;
            case LanResManager.getLanCommonTextWords("五毒圣镇"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",210));
               break;
            case LanResManager.getLanCommonTextWords("唐门绝技"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",211));
               break;
            case LanResManager.getLanCommonTextWords("炼宝剑"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",212));
               break;
            case LanResManager.getLanCommonTextWords("建设襄阳"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",213));
               break;
            case LanResManager.getLanCommonTextWords("狂暴"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",214));
               break;
            case LanResManager.getLanCommonTextWords("灭虫"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",215));
               break;
            case LanResManager.getLanCommonTextWords("活跃"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",216));
               break;
            case LanResManager.getLanCommonTextWords("金叶"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",217));
               break;
            case LanResManager.getLanCommonTextWords("放风筝"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",218));
               break;
            case LanResManager.getLanCommonTextWords("彻武权"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",219));
               break;
            case LanResManager.getLanCommonTextWords("神兽古墓"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",220));
               break;
            case LanResManager.getLanCommonTextWords("飞龙肾宝"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",221));
               break;
            case LanResManager.getLanCommonTextWords("战争"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",222));
               break;
            case LanResManager.getLanCommonTextWords("补偿"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",223));
               break;
            case LanResManager.getLanCommonTextWords("魔兵进攻"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",224));
               break;
            case LanResManager.getLanCommonTextWords("古墓争斗"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",225));
               break;
            case LanResManager.getLanCommonTextWords("牛郎织女"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",226));
               break;
            case LanResManager.getLanCommonTextWords("英雄战"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",227));
               break;
            case LanResManager.getLanCommonTextWords("桥连救母"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",228));
               break;
            case LanResManager.getLanCommonTextWords("开学气球"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",229));
               break;
            case LanResManager.getLanCommonTextWords("精英比才"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",230));
               break;
            case LanResManager.getLanCommonTextWords("六剑"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",231));
               break;
            case LanResManager.getLanCommonTextWords("中秋活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",232));
               break;
            case LanResManager.getLanCommonTextWords("五毒奇人"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",233));
               break;
            case LanResManager.getLanCommonTextWords("2017越南妇女节"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",234));
               break;
            case LanResManager.getLanCommonTextWords("2017维系武林"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",235));
               break;
            case LanResManager.getLanCommonTextWords("化妆活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",236));
               break;
            case LanResManager.getLanCommonTextWords("商人20171101"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",237));
               break;
            case LanResManager.getLanCommonTextWords("随心消费"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",238));
               break;
            case LanResManager.getLanCommonTextWords("望季典礼"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",239));
               break;
            case LanResManager.getLanCommonTextWords("堆雪人"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",240));
               break;
            case LanResManager.getLanCommonTextWords("5区新手好礼"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",241));
               break;
            case LanResManager.getLanCommonTextWords("出战活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",242));
               break;
            case LanResManager.getLanCommonTextWords("更新补偿活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",243));
               break;
            case LanResManager.getLanCommonTextWords("2018祭灶节"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",244));
               break;
            case LanResManager.getLanCommonTextWords("2018年灶爷"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",245));
               break;
            case LanResManager.getLanCommonTextWords("三合活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",246));
               break;
            case LanResManager.getLanCommonTextWords("新手活动2018"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",247));
               break;
            case LanResManager.getLanCommonTextWords("女儿赠送"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",248));
               break;
            case LanResManager.getLanCommonTextWords("情人节还礼"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",249));
               break;
            case LanResManager.getLanCommonTextWords("五色汤圆"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",250));
               break;
            case LanResManager.getLanCommonTextWords("夏日水果"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",251));
               break;
            case LanResManager.getLanCommonTextWords("飞升境界"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",252));
               break;
            case LanResManager.getLanCommonTextWords("世界杯2018"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",253));
               break;
            case LanResManager.getLanCommonTextWords("不败金身"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",254));
               break;
            case LanResManager.getLanCommonTextWords("要诀"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",255));
               break;
            case LanResManager.getLanCommonTextWords("版本累计"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",256));
               break;
            case LanResManager.getLanCommonTextWords("补偿1"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",257));
               break;
            case LanResManager.getLanCommonTextWords("兑换功能"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",258));
               break;
            case LanResManager.getLanCommonTextWords("幸运星星"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",259));
               break;
            case LanResManager.getLanCommonTextWords("英雄活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",260));
               break;
            case LanResManager.getLanCommonTextWords("酿酒活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",261));
               break;
            case LanResManager.getLanCommonTextWords("迎接国庆"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",263));
               break;
            case LanResManager.getLanCommonTextWords("四贵周期"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",264));
               break;
            case LanResManager.getLanCommonTextWords("中秋甜饼"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",265));
               break;
            case LanResManager.getLanCommonTextWords("收集古物"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",266));
               break;
            case LanResManager.getLanCommonTextWords("飞升境界2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",267));
               break;
            case LanResManager.getLanCommonTextWords("挑战活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",268));
               break;
            case LanResManager.getLanCommonTextWords("糖果兑换"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",269));
               break;
            case LanResManager.getLanCommonTextWords("锻炼宝石"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",270));
               break;
            case LanResManager.getLanCommonTextWords("幸运因素"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",271));
               break;
            case LanResManager.getLanCommonTextWords("冬天猎捕"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",272));
               break;
            case LanResManager.getLanCommonTextWords("冬天兑换"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",273));
               break;
            case LanResManager.getLanCommonTextWords("制造烟花"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",274));
               break;
            case LanResManager.getLanCommonTextWords("状王归天"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",275));
               break;
            case LanResManager.getLanCommonTextWords("猎手活动2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",276));
               break;
            case LanResManager.getLanCommonTextWords("V400优惠"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",277));
               break;
            case LanResManager.getLanCommonTextWords("新兵"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",278));
               break;
            case LanResManager.getLanCommonTextWords("七月精英"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",279));
               break;
            case LanResManager.getLanCommonTextWords("抓玉兔"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",280));
               break;
            case LanResManager.getLanCommonTextWords("内体"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",281));
               break;
            case LanResManager.getLanCommonTextWords("商人2"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",282));
               break;
            case LanResManager.getLanCommonTextWords("精英回令"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",283));
               break;
            case LanResManager.getLanCommonTextWords("八年服务器"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",284));
               break;
            case LanResManager.getLanCommonTextWords("八年生日庆祝"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",285));
               break;
            case LanResManager.getLanCommonTextWords("雪战服务器"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",286));
               break;
            case LanResManager.getLanCommonTextWords("繁华服务器"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",287));
               break;
            case "Thưởng Quà Đại Lễ":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",288));
               break;
            case "Cửa Hàng Ôn Luyện":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",289));
               break;
            case "Mùa Hè Sôi Động":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",290));
               break;
            case "Chi Mộng Trân Phẩm":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",291));
               break;
            case LanResManager.getLanCommonTextWords("浏览-SS1"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",292));
               break;
            case "Vương Giả":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",293));
               break;
            case LanResManager.getLanCommonTextWords("2023新手活动"):
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",294));
               break;
            case "Lễ Hội Hoá Trang":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",295));
               break;
            case "Đón Xuân":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",296));
               break;
            case "Đổi Thưởng Tết":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",297));
               break;
            case "Tết Nguyên Tiêu":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",298));
               break;
            case "Miễn Phí 04/04":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",299));
               break;
            case "Level UP":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",300));
               break;
            case "Ưu Đãi":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",301));
               break;
            case "Hồi Mộng Các":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",302));
               break;
            case "Chi Mộng Lệnh":
               dispatchEvent(new BaseEvent(UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,"",303));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.tabBar.removeAllButton();
            parent.removeChild(this);
         }
      }
      
      public function openHuodongs(param1:Array) : void
      {
         this.xianshiduihuan.openHuodongs(param1);
      }
      
      public function closeAllHuodong() : void
      {
         this.xianshiduihuan.openHuodongs([]);
      }
      
      public function setDes(param1:String = "", param2:int = 0) : void
      {
         this.xianshiduihuan.setDes(param1,param2);
      }
      
      public function showHuodong(param1:int, param2:Array) : void
      {
         this.xianshiduihuan.showHuodong(param1,param2);
      }
      
      public function setBiaoqian(param1:int) : void
      {
         if(param1 == 1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("限时大奖兑换"));
         }
         else if(param1 == 2)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("永久活动"));
         }
         else if(param1 == 3)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("勋章活动"));
         }
         else if(param1 == 4)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("功法活动"));
         }
         else if(param1 == 5)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("装备活动"));
         }
         else if(param1 == 6)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("高级装备"));
         }
         else if(param1 == 20)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("新手活动"));
         }
         else if(param1 == 22)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武林神兵"));
         }
         else if(param1 == 23)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("金身"));
         }
         else if(param1 == 25)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("三八活动"));
         }
         else if(param1 == 26)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("情人节玫瑰"));
         }
         else if(param1 == 27)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("永久活动3"));
         }
         else if(param1 == 28)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("玄说矿石"));
         }
         else if(param1 == 29)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("神兵不可思议"));
         }
         else if(param1 == 30)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("傲神神龙"));
         }
         else if(param1 == 31)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("锻打神器"));
         }
         else if(param1 == 32)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("王者武装"));
         }
         else if(param1 == 33)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("血风"));
         }
         else if(param1 == 34)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("雄王活动"));
         }
         else if(param1 == 35)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("显赫战功"));
         }
         else if(param1 == 36)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("解放日活动"));
         }
         else if(param1 == 37)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("五一活动"));
         }
         else if(param1 == 38)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("优惠活动"));
         }
         else if(param1 == 40)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("超级强化"));
         }
         else if(param1 == 41)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("519优惠"));
         }
         else if(param1 == 42)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("降龙护体"));
         }
         else if(param1 == 43)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("欧洲足球"));
         }
         else if(param1 == 44)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("儿童节活动"));
         }
         else if(param1 == 45)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("儿童节称号"));
         }
         else if(param1 == 46)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("61活动"));
         }
         else if(param1 == 47)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("欧洲足球2"));
         }
         else if(param1 == 48)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("灭蜜蜂"));
         }
         else if(param1 == 49)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("端午节"));
         }
         else if(param1 == 50)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("毕方出世"));
         }
         else if(param1 == 51)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("每天优惠2"));
         }
         else if(param1 == 52)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("超级强化2"));
         }
         else if(param1 == 56)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("追龙血杀"));
         }
         else if(param1 == 57)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("龙晶之宝"));
         }
         else if(param1 == 58)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("争斗"));
         }
         else if(param1 == 59)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武装互助"));
         }
         else if(param1 == 60)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("开战"));
         }
         else if(param1 == 61)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("王帮"));
         }
         else if(param1 == 62)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("送满心爱"));
         }
         else if(param1 == 63)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("夏天快乐"));
         }
         else if(param1 == 64)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("恍如隔世"));
         }
         else if(param1 == 65)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("四灵大战"));
         }
         else if(param1 == 66)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("打造神兵"));
         }
         else if(param1 == 67)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("天定魂魄"));
         }
         else if(param1 == 68)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("龙晶礼包"));
         }
         else if(param1 == 69)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("总决赛兑换"));
         }
         else if(param1 == 70)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("高手无双"));
         }
         else if(param1 == 71)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("圣战士"));
         }
         else if(param1 == 72)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("烈火圣蝎"));
         }
         else if(param1 == 74)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("五绝功法"));
         }
         else if(param1 == 75)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("神秘礼物"));
         }
         else if(param1 == 76)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("魂牵梦"));
         }
         else if(param1 == 77)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("乐心出击"));
         }
         else if(param1 == 78)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("周一活动"));
         }
         else if(param1 == 79)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("周二活动"));
         }
         else if(param1 == 80)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("周三活动"));
         }
         else if(param1 == 81)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("周四活动"));
         }
         else if(param1 == 82)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("周五活动"));
         }
         else if(param1 == 83)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("周六活动"));
         }
         else if(param1 == 84)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("周日活动"));
         }
         else if(param1 == 85)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("每日优惠3"));
         }
         else if(param1 == 86)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("盂兰盒节"));
         }
         else if(param1 == 87)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("精髓东霞"));
         }
         else if(param1 == 88)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("开真元"));
         }
         else if(param1 == 89)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("七子全真教"));
         }
         else if(param1 == 90)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("八月底"));
         }
         else if(param1 == 91)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("降龙晶"));
         }
         else if(param1 == 92)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("七剑英雄"));
         }
         else if(param1 == 93)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("国庆活动"));
         }
         else if(param1 == 94)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("襄阳月色"));
         }
         else if(param1 == 99)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("群英取回"));
         }
         else if(param1 == 100)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武神"));
         }
         else if(param1 == 101)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("西川红棉白花袍"));
         }
         else if(param1 == 102)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("神秘礼包"));
         }
         else if(param1 == 103)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("开真元2"));
         }
         else if(param1 == 172)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("开真元3"));
         }
         else if(param1 == 104)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("夏天快乐2"));
         }
         else if(param1 == 159)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("夏天快乐3"));
         }
         else if(param1 == 160)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("夏天快乐4"));
         }
         else if(param1 == 105)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("王者争雄"));
         }
         else if(param1 == 106)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("终极坐骑神丹"));
         }
         else if(param1 == 107)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("坐骑赔偿"));
         }
         else if(param1 == 108)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("强化之神2"));
         }
         else if(param1 == 109)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("王帮出战"));
         }
         else if(param1 == 110)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("维系礼包"));
         }
         else if(param1 == 111)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("九月底"));
         }
         else if(param1 == 112)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("穷尽战意"));
         }
         else if(param1 == 113)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("强化之神3"));
         }
         else if(param1 == 114)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("强化之神4"));
         }
         else if(param1 == 115)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武神2"));
         }
         else if(param1 == 116)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("龙晶2"));
         }
         else if(param1 == 117)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("终极坐骑神丹2"));
         }
         else if(param1 == 118)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("四龙天爪"));
         }
         else if(param1 == 119)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("五色朵花"));
         }
         else if(param1 == 120)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("越南妇女节"));
         }
         else if(param1 == 121)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("龙魂"));
         }
         else if(param1 == 164)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("龙魂2"));
         }
         else if(param1 == 165)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("龙魂3"));
         }
         else if(param1 == 122)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("战绩飘荡"));
         }
         else if(param1 == 123)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("傲剑五年"));
         }
         else if(param1 == 124)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("天马剑"));
         }
         else if(param1 == 125)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("五年之梦"));
         }
         else if(param1 == 126)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("五年之恩"));
         }
         else if(param1 == 127)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("甜蜜蛋糕"));
         }
         else if(param1 == 128)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("无尽快乐"));
         }
         else if(param1 == 129)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("八怪武神盾"));
         }
         else if(param1 == 130)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("突破武功"));
         }
         else if(param1 == 131)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("六脉剑"));
         }
         else if(param1 == 132)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("寻师学道"));
         }
         else if(param1 == 133)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("一大尊师"));
         }
         else if(param1 == 134)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("王者"));
         }
         else if(param1 == 136)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武魂剑"));
         }
         else if(param1 == 137)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("顶峰神兽"));
         }
         else if(param1 == 138)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("天象王者"));
         }
         else if(param1 == 139)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("七色葫芦"));
         }
         else if(param1 == 140)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("伴随足球队"));
         }
         else if(param1 == 141)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("震天神器"));
         }
         else if(param1 == 142)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("龙晶章"));
         }
         else if(param1 == 143)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("飞龙晶"));
         }
         else if(param1 == 170)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("飞龙晶2"));
         }
         else if(param1 == 171)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("飞龙晶3"));
         }
         else if(param1 == 144)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("半决赛领奖"));
         }
         else if(param1 == 145)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("寻找宝藏"));
         }
         else if(param1 == 146)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("惊喜金票大奖"));
         }
         else if(param1 == 147)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("震天戟"));
         }
         else if(param1 == 148)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("华山五章"));
         }
         else if(param1 == 149)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("天雪神兵"));
         }
         else if(param1 == 150)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("桃花酒"));
         }
         else if(param1 == 162)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("桃花酒2"));
         }
         else if(param1 == 163)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("桃花酒3"));
         }
         else if(param1 == 151)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("开春万福"));
         }
         else if(param1 == 152)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("新年礼包"));
         }
         else if(param1 == 153)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("降龙超级"));
         }
         else if(param1 == 166)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("降龙超级2"));
         }
         else if(param1 == 167)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("降龙超级3"));
         }
         else if(param1 == 154)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("腾天羽"));
         }
         else if(param1 == 161)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("腾天羽2"));
         }
         else if(param1 == 155)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("威勇无双"));
         }
         else if(param1 == 156)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("无尽金锭日"));
         }
         else if(param1 == 168)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("无尽金锭日2"));
         }
         else if(param1 == 169)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("无尽金锭日3"));
         }
         else if(param1 == 157)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("雄鸡权"));
         }
         else if(param1 == 158)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("春节对联"));
         }
         else if(param1 == 173)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("盖世神龙"));
         }
         else if(param1 == 174)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("姑姑成亲"));
         }
         else if(param1 == 175)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("天玉蟾"));
         }
         else if(param1 == 176)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("天神石"));
         }
         else if(param1 == 177)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("七星装备"));
         }
         else if(param1 == 178)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("灵丹珍品1"));
         }
         else if(param1 == 179)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("灵丹珍品2"));
         }
         else if(param1 == 180)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("灵丹珍品3"));
         }
         else if(param1 == 181)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("2月底"));
         }
         else if(param1 == 182)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("襄阳对决1"));
         }
         else if(param1 == 183)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("襄阳对决2"));
         }
         else if(param1 == 184)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("无尽剑"));
         }
         else if(param1 == 185)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("英雄除暴"));
         }
         else if(param1 == 186)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("襄阳对决3"));
         }
         else if(param1 == 187)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("无毒圣阵"));
         }
         else if(param1 == 188)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("绝世佳人1"));
         }
         else if(param1 == 189)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("绝世佳人2"));
         }
         else if(param1 == 190)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("绝世佳人3"));
         }
         else if(param1 == 191)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("爱情糖果"));
         }
         else if(param1 == 192)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("中原保镖"));
         }
         else if(param1 == 193)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("天道"));
         }
         else if(param1 == 194)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("追寻降龙"));
         }
         else if(param1 == 195)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("3月底"));
         }
         else if(param1 == 196)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("圣火"));
         }
         else if(param1 == 197)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("神风"));
         }
         else if(param1 == 198)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武林至宝"));
         }
         else if(param1 == 199)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("第五次王者之帮"));
         }
         else if(param1 == 200)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("不灭朱雀"));
         }
         else if(param1 == 201)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("精英聚会"));
         }
         else if(param1 == 202)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("全龙"));
         }
         else if(param1 == 203)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武林秘籍"));
         }
         else if(param1 == 204)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("四月底"));
         }
         else if(param1 == 205)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("战神中原"));
         }
         else if(param1 == 206)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("大节优惠"));
         }
         else if(param1 == 207)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武林大战"));
         }
         else if(param1 == 208)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("万毒灵"));
         }
         else if(param1 == 209)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("江湖论武"));
         }
         else if(param1 == 210)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("五毒圣镇"));
         }
         else if(param1 == 211)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("唐门绝技"));
         }
         else if(param1 == 212)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("炼宝剑"));
         }
         else if(param1 == 213)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("建设襄阳"));
         }
         else if(param1 == 214)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("狂暴"));
         }
         else if(param1 == 215)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("灭虫"));
         }
         else if(param1 == 216)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃"));
         }
         else if(param1 == 217)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("金叶"));
         }
         else if(param1 == 218)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("放风筝"));
         }
         else if(param1 == 219)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("彻武权"));
         }
         else if(param1 == 220)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("神兽古墓"));
         }
         else if(param1 == 221)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("飞龙肾宝"));
         }
         else if(param1 == 222)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("战争"));
         }
         else if(param1 == 223)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("补偿"));
         }
         else if(param1 == 224)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("魔兵进攻"));
         }
         else if(param1 == 225)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("古墓争斗"));
         }
         else if(param1 == 226)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("牛郎织女"));
         }
         else if(param1 == 227)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("英雄战"));
         }
         else if(param1 == 228)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("桥连救母"));
         }
         else if(param1 == 229)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("开学气球"));
         }
         else if(param1 == 230)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("精英比才"));
         }
         else if(param1 == 231)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("六剑"));
         }
         else if(param1 == 232)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("中秋活动"));
         }
         else if(param1 == 233)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("五毒奇人"));
         }
         else if(param1 == 234)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("2017越南妇女节"));
         }
         else if(param1 == 235)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("2017维系武林"));
         }
         else if(param1 == 236)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("化妆活动"));
         }
         else if(param1 == 237)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("商人20171101"));
         }
         else if(param1 == 238)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("随心消费"));
         }
         else if(param1 == 239)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("望季典礼"));
         }
         else if(param1 == 240)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("堆雪人"));
         }
         else if(param1 == 241)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("5区新手好礼"));
         }
         else if(param1 == 242)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("出战活动"));
         }
         else if(param1 == 243)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("更新补偿活动"));
         }
         else if(param1 == 244)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("2018祭灶节"));
         }
         else if(param1 == 245)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("2018年灶爷"));
         }
         else if(param1 == 246)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("三合活动"));
         }
         else if(param1 == 247)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("新手活动2018"));
         }
         else if(param1 == 248)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("女儿赠送"));
         }
         else if(param1 == 249)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("情人节还礼"));
         }
         else if(param1 == 250)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("五色汤圆"));
         }
         else if(param1 == 251)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("夏日水果"));
         }
         else if(param1 == 252)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("飞升境界"));
         }
         else if(param1 == 253)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("世界杯2018"));
         }
         else if(param1 == 254)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("不败金身"));
         }
         else if(param1 == 255)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("要诀"));
         }
         else if(param1 == 256)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("版本累计"));
         }
         else if(param1 == 257)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("补偿1"));
         }
         else if(param1 == 258)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("兑换功能"));
         }
         else if(param1 == 259)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("幸运星星"));
         }
         else if(param1 == 260)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("英雄活动"));
         }
         else if(param1 == 261)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("酿酒活动"));
         }
         else if(param1 == 263)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("迎接国庆"));
         }
         else if(param1 == 264)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("四贵周期"));
         }
         else if(param1 == 265)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("中秋甜饼"));
         }
         else if(param1 == 266)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("收集古物"));
         }
         else if(param1 == 267)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("飞升境界2"));
         }
         else if(param1 == 268)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("挑战活动"));
         }
         else if(param1 == 269)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("糖果兑换"));
         }
         else if(param1 == 270)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("锻炼宝石"));
         }
         else if(param1 == 271)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("幸运因素"));
         }
         else if(param1 == 272)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("冬天猎捕"));
         }
         else if(param1 == 273)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("冬天兑换"));
         }
         else if(param1 == 274)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("制造烟花"));
         }
         else if(param1 == 275)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("状王归天"));
         }
         else if(param1 == 276)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("猎手活动2"));
         }
         else if(param1 == 277)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("V400优惠"));
         }
         else if(param1 == 278)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("新兵"));
         }
         else if(param1 == 279)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("七月精英"));
         }
         else if(param1 == 280)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("抓玉兔"));
         }
         else if(param1 == 281)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("内体"));
         }
         else if(param1 == 282)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("商人2"));
         }
         else if(param1 == 283)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("精英回令"));
         }
         else if(param1 == 284)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("八年服务器"));
         }
         else if(param1 == 285)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("八年生日庆祝"));
         }
         else if(param1 == 286)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("雪战服务器"));
         }
         else if(param1 == 287)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("繁华服务器"));
         }
         else if(param1 == 288)
         {
            this.tabBar.setCurrentButtonByLabel("Thưởng Quà Đại Lễ");
         }
         else if(param1 == 289)
         {
            this.tabBar.setCurrentButtonByLabel("Cửa Hàng Ôn Luyện");
         }
         else if(param1 == 290)
         {
            this.tabBar.setCurrentButtonByLabel("Mùa Hè Sôi Động");
         }
         else if(param1 == 291)
         {
            this.tabBar.setCurrentButtonByLabel("Chi Mộng Trân Phẩm");
         }
         else if(param1 == 292)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("浏览-SS1"));
         }
         else if(param1 == 293)
         {
            this.tabBar.setCurrentButtonByLabel("Vương Giả");
         }
         else if(param1 == 294)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("2023新手活动"));
         }
         else if(param1 == 295)
         {
            this.tabBar.setCurrentButtonByLabel("Lễ Hội Hoá Trang");
         }
         else if(param1 == 296)
         {
            this.tabBar.setCurrentButtonByLabel("Đón Xuân");
         }
         else if(param1 == 297)
         {
            this.tabBar.setCurrentButtonByLabel("Đổi Thưởng Tết");
         }
         else if(param1 == 298)
         {
            this.tabBar.setCurrentButtonByLabel("Tết Nguyên Tiêu");
         }
         else if(param1 == 299)
         {
            this.tabBar.setCurrentButtonByLabel("Miễn Phí 04/04");
         }
         else if(param1 == 300)
         {
            this.tabBar.setCurrentButtonByLabel("Level UP");
         }
         else if(param1 == 301)
         {
            this.tabBar.setCurrentButtonByLabel("Ưu Đãi");
         }
         else if(param1 == 302)
         {
            this.tabBar.setCurrentButtonByLabel("Hồi Mộng Các");
         }
         else if(param1 == 303)
         {
            this.tabBar.setCurrentButtonByLabel("Chi Mộng Lệnh");
         }
      }
      
      public function setBtnXuanzhong(param1:int) : void
      {
         this.xianshiduihuan.setBtnXuanzhong(param1);
      }
      
      public function addTabBar(param1:int) : void
      {
         if(param1 == 20)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("新手活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("新手活动");
         }
         else if(param1 == 21)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("特殊活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("特殊活动");
         }
         else if(param1 == 22)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("武林神兵"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("武林神兵");
         }
         else if(param1 == 23)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("金身"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("金身");
         }
         else if(param1 == 25)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三八活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("三八活动");
         }
         else if(param1 == 26)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("情人节玫瑰"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("情人节玫瑰");
         }
         else if(param1 == 28)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("玄说矿石"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("玄说矿石");
         }
         else if(param1 == 29)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("神兵不可思议"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("神兵不可思议");
         }
         else if(param1 == 30)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("傲神神龙"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("傲神神龙");
         }
         else if(param1 == 31)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("锻打神器"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("锻打神器");
         }
         else if(param1 == 32)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("王者武装"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("王者武装");
         }
         else if(param1 == 33)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("血风"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("血风");
         }
         else if(param1 == 34)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("雄王活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("雄王活动");
         }
         else if(param1 == 35)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("显赫战功"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("显赫战功");
         }
         else if(param1 == 36)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("解放日活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("解放日活动");
         }
         else if(param1 == 37)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五一活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("五一活动");
         }
         else if(param1 == 38)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("优惠活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("优惠活动");
         }
         else if(param1 == 40)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("超级强化"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("超级强化");
         }
         else if(param1 == 41)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("519优惠"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("519优惠");
         }
         else if(param1 == 42)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("降龙护体"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("降龙护体");
         }
         else if(param1 == 43)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("欧洲足球"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("欧洲足球");
         }
         else if(param1 == 44)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("儿童节活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("儿童节活动");
         }
         else if(param1 == 45)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("儿童节称号"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("儿童节称号");
         }
         else if(param1 == 46)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("61活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("61活动");
         }
         else if(param1 == 47)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("欧洲足球2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("欧洲足球2");
         }
         else if(param1 == 48)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("灭蜜蜂"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("灭蜜蜂");
         }
         else if(param1 == 49)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("端午节"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("端午节");
         }
         else if(param1 == 50)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("毕方出世"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("毕方出世");
         }
         else if(param1 == 51)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("每天优惠2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("每天优惠2");
         }
         else if(param1 == 52)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("超级强化2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("超级强化2");
         }
         else if(param1 == 53)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("2016足球"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("2016足球");
         }
         else if(param1 == 54)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("旗色衣色"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("旗色衣色");
         }
         else if(param1 == 55)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("知恩"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("知恩");
         }
         else if(param1 == 56)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("追龙血杀"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("追龙血杀");
         }
         else if(param1 == 57)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙晶之宝"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("龙晶之宝");
         }
         else if(param1 == 58)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("争斗"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("争斗");
         }
         else if(param1 == 59)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("武装互助"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("武装互助");
         }
         else if(param1 == 60)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("开战"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("开战");
         }
         else if(param1 == 61)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("王帮"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("王帮");
         }
         else if(param1 == 62)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("送满心爱"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("送满心爱");
         }
         else if(param1 == 63)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("夏天快乐"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("夏天快乐");
         }
         else if(param1 == 64)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("恍如隔世"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("恍如隔世");
         }
         else if(param1 == 65)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四灵大战"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("四灵大战");
         }
         else if(param1 == 66)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("打造神兵"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("打造神兵");
         }
         else if(param1 == 67)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("天定魂魄"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("天定魂魄");
         }
         else if(param1 == 68)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙晶礼包"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("龙晶礼包");
         }
         else if(param1 == 69)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("总决赛兑换"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("总决赛兑换");
         }
         else if(param1 == 70)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("高手无双"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("高手无双");
         }
         else if(param1 == 71)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("圣战士"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("圣战士");
         }
         else if(param1 == 72)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("烈火圣蝎"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("烈火圣蝎");
         }
         else if(param1 == 74)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五绝功法"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("五绝功法");
         }
         else if(param1 == 75)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("神秘礼物"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("神秘礼物");
         }
         else if(param1 == 76)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("魂牵梦"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("魂牵梦");
         }
         else if(param1 == 77)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("乐心出击"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("乐心出击");
         }
         else if(param1 == 78)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("周一活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("周一活动");
         }
         else if(param1 == 79)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("周二活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("周二活动");
         }
         else if(param1 == 80)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("周三活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("周三活动");
         }
         else if(param1 == 81)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("周四活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("周四活动");
         }
         else if(param1 == 82)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("周五活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("周五活动");
         }
         else if(param1 == 83)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("周六活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("周六活动");
         }
         else if(param1 == 84)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("周日活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("周日活动");
         }
         else if(param1 == 85)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("每日优惠3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("每日优惠3");
         }
         else if(param1 == 86)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("盂兰盒节"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("盂兰盒节");
         }
         else if(param1 == 87)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("精髓东霞"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("精髓东霞");
         }
         else if(param1 == 88)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("开真元"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("开真元");
         }
         else if(param1 == 89)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七子全真教"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("七子全真教");
         }
         else if(param1 == 90)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("八月底"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("八月底");
         }
         else if(param1 == 91)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("降龙晶"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("降龙晶");
         }
         else if(param1 == 92)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七剑英雄"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("七剑英雄");
         }
         else if(param1 == 93)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("国庆活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("国庆活动");
         }
         else if(param1 == 94)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("襄阳月色"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("襄阳月色");
         }
         else if(param1 == 99)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("群英取回"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("群英取回");
         }
         else if(param1 == 100)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("武神"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("武神");
         }
         else if(param1 == 101)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("西川红棉白花袍"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("西川红棉白花袍");
         }
         else if(param1 == 102)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("神秘礼包"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("神秘礼包");
         }
         else if(param1 == 103)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("开真元2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("开真元2");
         }
         else if(param1 == 172)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("开真元3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("开真元3");
         }
         else if(param1 == 104)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("夏天快乐2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("夏天快乐2");
         }
         else if(param1 == 159)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("夏天快乐3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("夏天快乐3");
         }
         else if(param1 == 160)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("夏天快乐4"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("夏天快乐4");
         }
         else if(param1 == 105)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("王者争雄"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("王者争雄");
         }
         else if(param1 == 106)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("终极坐骑神丹"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("终极坐骑神丹");
         }
         else if(param1 == 107)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("坐骑赔偿"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("坐骑赔偿");
         }
         else if(param1 == 108)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("强化之神2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("强化之神2");
         }
         else if(param1 == 109)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("王帮出战"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("王帮出战");
         }
         else if(param1 == 110)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("维系礼包"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("维系礼包");
         }
         else if(param1 == 111)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("九月底"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("九月底");
         }
         else if(param1 == 112)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("穷尽战意"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("穷尽战意");
         }
         else if(param1 == 113)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("强化之神3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("强化之神3");
         }
         else if(param1 == 114)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("强化之神4"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("强化之神4");
         }
         else if(param1 == 115)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("武神2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("武神2");
         }
         else if(param1 == 116)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙晶2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("龙晶2");
         }
         else if(param1 == 117)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("终极坐骑神丹2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("终极坐骑神丹2");
         }
         else if(param1 == 118)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四龙天爪"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("四龙天爪");
         }
         else if(param1 == 119)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五色朵花"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("五色朵花");
         }
         else if(param1 == 120)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("越南妇女节"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("越南妇女节");
         }
         else if(param1 == 121)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙魂"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("龙魂");
         }
         else if(param1 == 164)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙魂2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("龙魂2");
         }
         else if(param1 == 165)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙魂3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("龙魂3");
         }
         else if(param1 == 122)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("战绩飘荡"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("战绩飘荡");
         }
         else if(param1 == 123)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("傲剑五年"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("傲剑五年");
         }
         else if(param1 == 124)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("天马剑"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("天马剑");
         }
         else if(param1 == 125)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五年之梦"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("五年之梦");
         }
         else if(param1 == 126)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五年之恩"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("五年之恩");
         }
         else if(param1 == 127)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("甜蜜蛋糕"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("甜蜜蛋糕");
         }
         else if(param1 == 128)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("无尽快乐"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("无尽快乐");
         }
         else if(param1 == 129)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("八怪武神盾"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("八怪武神盾");
         }
         else if(param1 == 130)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("突破武功"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("突破武功");
         }
         else if(param1 == 131)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("六脉剑"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("六脉剑");
         }
         else if(param1 == 132)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("寻师学道"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("寻师学道");
         }
         else if(param1 == 133)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一大尊师"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("一大尊师");
         }
         else if(param1 == 134)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("王者"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("王者");
         }
         else if(param1 == 136)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("武魂剑"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("武魂剑");
         }
         else if(param1 == 137)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("顶峰神兽"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("顶峰神兽");
         }
         else if(param1 == 138)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("天象王者"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("天象王者");
         }
         else if(param1 == 139)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七色葫芦"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("七色葫芦");
         }
         else if(param1 == 140)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("伴随足球队"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("伴随足球队");
         }
         else if(param1 == 141)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("震天神器"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("震天神器");
         }
         else if(param1 == 142)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("龙晶章"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("龙晶章");
         }
         else if(param1 == 143)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("飞龙晶"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("飞龙晶");
         }
         else if(param1 == 170)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("飞龙晶2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("飞龙晶2");
         }
         else if(param1 == 171)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("飞龙晶3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("飞龙晶3");
         }
         else if(param1 == 144)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("半决赛领奖"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("半决赛领奖");
         }
         else if(param1 == 145)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("寻找宝藏"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("寻找宝藏");
         }
         else if(param1 == 146)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("惊喜金票大奖"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("惊喜金票大奖");
         }
         else if(param1 == 147)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("震天戟"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("震天戟");
         }
         else if(param1 == 148)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("华山五章"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("华山五章");
         }
         else if(param1 == 149)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("天雪神兵"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("天雪神兵");
         }
         else if(param1 == 150)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("桃花酒"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("桃花酒");
         }
         else if(param1 == 162)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("桃花酒2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("桃花酒2");
         }
         else if(param1 == 163)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("桃花酒3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("桃花酒3");
         }
         else if(param1 == 151)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("开春万福"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("开春万福");
         }
         else if(param1 == 152)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("新年礼包"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("新年礼包");
         }
         else if(param1 == 153)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("降龙超级"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("降龙超级");
         }
         else if(param1 == 166)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("降龙超级2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("降龙超级2");
         }
         else if(param1 == 167)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("降龙超级3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("降龙超级3");
         }
         else if(param1 == 154)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("腾天羽"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("腾天羽");
         }
         else if(param1 == 161)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("腾天羽2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("腾天羽2");
         }
         else if(param1 == 155)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("威勇无双"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("威勇无双");
         }
         else if(param1 == 156)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("无尽金锭日"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("无尽金锭日");
         }
         else if(param1 == 168)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("无尽金锭日2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("无尽金锭日2");
         }
         else if(param1 == 169)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("无尽金锭日3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("无尽金锭日3");
         }
         else if(param1 == 157)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("雄鸡权"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("雄鸡权");
         }
         else if(param1 == 158)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("春节对联"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("春节对联");
         }
         else if(param1 == 173)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("盖世神龙"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("盖世神龙");
         }
         else if(param1 == 174)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("姑姑成亲"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("姑姑成亲");
         }
         else if(param1 == 175)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("天玉蟾"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("天玉蟾");
         }
         else if(param1 == 176)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("天神石"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("天神石");
         }
         else if(param1 == 177)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七星装备"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("七星装备");
         }
         else if(param1 == 178)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("灵丹珍品1"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("灵丹珍品1");
         }
         else if(param1 == 179)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("灵丹珍品2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("灵丹珍品2");
         }
         else if(param1 == 180)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("灵丹珍品3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("灵丹珍品3");
         }
         else if(param1 == 181)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("2月底"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("2月底");
         }
         else if(param1 == 182)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("襄阳对决1"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("襄阳对决1");
         }
         else if(param1 == 183)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("襄阳对决2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("襄阳对决2");
         }
         else if(param1 == 184)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("无尽剑"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("无尽剑");
         }
         else if(param1 == 185)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("英雄除暴"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("英雄除暴");
         }
         else if(param1 == 186)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("襄阳对决3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("襄阳对决3");
         }
         else if(param1 == 187)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("无毒圣阵"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("无毒圣阵");
         }
         else if(param1 == 188)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("绝世佳人1"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("绝世佳人1");
         }
         else if(param1 == 189)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("绝世佳人2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("绝世佳人2");
         }
         else if(param1 == 190)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("绝世佳人3"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("绝世佳人3");
         }
         else if(param1 == 191)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("爱情糖果"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("爱情糖果");
         }
         else if(param1 == 192)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("中原保镖"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("中原保镖");
         }
         else if(param1 == 193)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("天道"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("天道");
         }
         else if(param1 == 194)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("追寻降龙"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("追寻降龙");
         }
         else if(param1 == 195)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("3月底"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("3月底");
         }
         else if(param1 == 196)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("圣火"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("圣火");
         }
         else if(param1 == 197)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("神风"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("神风");
         }
         else if(param1 == 198)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("武林至宝"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("武林至宝");
         }
         else if(param1 == 199)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("第五次王者之帮"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("第五次王者之帮");
         }
         else if(param1 == 200)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("不灭朱雀"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("不灭朱雀");
         }
         else if(param1 == 201)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("精英聚会"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("精英聚会");
         }
         else if(param1 == 202)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("全龙"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("全龙");
         }
         else if(param1 == 203)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("武林秘籍"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("武林秘籍");
         }
         else if(param1 == 204)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四月底"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("四月底");
         }
         else if(param1 == 205)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("战神中原"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("战神中原");
         }
         else if(param1 == 206)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("大节优惠"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("大节优惠");
         }
         else if(param1 == 207)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("武林大战"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("武林大战");
         }
         else if(param1 == 208)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("万毒灵"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("万毒灵");
         }
         else if(param1 == 209)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("江湖论武"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("江湖论武");
         }
         else if(param1 == 210)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五毒圣镇"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("五毒圣镇");
         }
         else if(param1 == 211)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("唐门绝技"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("唐门绝技");
         }
         else if(param1 == 212)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("炼宝剑"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("炼宝剑");
         }
         else if(param1 == 213)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("建设襄阳"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("建设襄阳");
         }
         else if(param1 == 214)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("狂暴"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("狂暴");
         }
         else if(param1 == 215)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("灭虫"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("灭虫");
         }
         else if(param1 == 216)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("活跃");
         }
         else if(param1 == 217)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("金叶"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("金叶");
         }
         else if(param1 == 218)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("放风筝"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("放风筝");
         }
         else if(param1 == 219)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("彻武权"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("彻武权");
         }
         else if(param1 == 220)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("神兽古墓"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("神兽古墓");
         }
         else if(param1 == 221)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("飞龙肾宝"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("飞龙肾宝");
         }
         else if(param1 == 222)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("战争"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("战争");
         }
         else if(param1 == 223)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("补偿"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("补偿");
         }
         else if(param1 == 224)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("魔兵进攻"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("魔兵进攻");
         }
         else if(param1 == 225)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("古墓争斗"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("古墓争斗");
         }
         else if(param1 == 226)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("牛郎织女"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("牛郎织女");
         }
         else if(param1 == 227)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("英雄战"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("英雄战");
         }
         else if(param1 == 228)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("桥连救母"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("桥连救母");
         }
         else if(param1 == 229)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("开学气球"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("开学气球");
         }
         else if(param1 == 230)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("精英比才"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("精英比才");
         }
         else if(param1 == 231)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("六剑"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("六剑");
         }
         else if(param1 == 232)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("中秋活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("中秋活动");
         }
         else if(param1 == 233)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五毒奇人"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("五毒奇人");
         }
         else if(param1 == 234)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("2017越南妇女节"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("2017越南妇女节");
         }
         else if(param1 == 235)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("2017维系武林"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("2017维系武林");
         }
         else if(param1 == 236)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("化妆活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("化妆活动");
         }
         else if(param1 == 237)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("商人20171101"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("商人20171101");
         }
         else if(param1 == 238)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("随心消费"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("随心消费");
         }
         else if(param1 == 239)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("望季典礼"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("望季典礼");
         }
         else if(param1 == 240)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("堆雪人"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("堆雪人");
         }
         else if(param1 == 241)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("5区新手好礼"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("5区新手好礼");
         }
         else if(param1 == 242)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("出战活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("出战活动");
         }
         else if(param1 == 243)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("更新补偿活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("更新补偿活动");
         }
         else if(param1 == 244)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("2018祭灶节"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("2018祭灶节");
         }
         else if(param1 == 245)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("2018年灶爷"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("2018年灶爷");
         }
         else if(param1 == 246)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三合活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("三合活动");
         }
         else if(param1 == 247)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("新手活动2018"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("新手活动2018");
         }
         else if(param1 == 248)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("女儿赠送"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("女儿赠送");
         }
         else if(param1 == 249)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("情人节还礼"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("情人节还礼");
         }
         else if(param1 == 250)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五色汤圆"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("五色汤圆");
         }
         else if(param1 == 251)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("夏日水果"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("夏日水果");
         }
         else if(param1 == 252)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("飞升境界"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("飞升境界");
         }
         else if(param1 == 253)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("世界杯2018"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("世界杯2018");
         }
         else if(param1 == 254)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("不败金身"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("不败金身");
         }
         else if(param1 == 255)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("要诀"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("要诀");
         }
         else if(param1 == 256)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("版本累计"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("版本累计");
         }
         else if(param1 == 257)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("补偿1"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("补偿1");
         }
         else if(param1 == 258)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("兑换功能"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("兑换功能");
         }
         else if(param1 == 259)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("幸运星星"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("幸运星星");
         }
         else if(param1 == 260)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords(""),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("英雄活动");
         }
         else if(param1 == 261)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("酿酒活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("酿酒活动");
         }
         else if(param1 == 263)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("迎接国庆"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("迎接国庆");
         }
         else if(param1 == 264)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四贵周期"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("四贵周期");
         }
         else if(param1 == 265)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("中秋甜饼"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("中秋甜饼");
         }
         else if(param1 == 266)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("收集古物"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("收集古物");
         }
         else if(param1 == 267)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("飞升境界2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("飞升境界2");
         }
         else if(param1 == 268)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("挑战活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("挑战活动");
         }
         else if(param1 == 269)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("糖果兑换"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("糖果兑换");
         }
         else if(param1 == 270)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("锻炼宝石"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("锻炼宝石");
         }
         else if(param1 == 271)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("幸运因素"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("幸运因素");
         }
         else if(param1 == 272)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("冬天猎捕"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("冬天猎捕");
         }
         else if(param1 == 273)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("冬天兑换"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("冬天兑换");
         }
         else if(param1 == 274)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("制造烟花"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("制造烟花");
         }
         else if(param1 == 275)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("状王归天"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("状王归天");
         }
         else if(param1 == 276)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("猎手活动2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("猎手活动2");
         }
         else if(param1 == 277)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("V400优惠"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("V400优惠");
         }
         else if(param1 == 278)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("新兵"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("新兵");
         }
         else if(param1 == 279)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七月精英"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("七月精英");
         }
         else if(param1 == 280)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("抓玉兔"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("抓玉兔");
         }
         else if(param1 == 281)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("内体"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("内体");
         }
         else if(param1 == 282)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("商人2"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("商人2");
         }
         else if(param1 == 283)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("精英回令"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("精英回令");
         }
         else if(param1 == 284)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("八年服务器"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("八年服务器");
         }
         else if(param1 == 285)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("八年生日庆祝"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("八年生日庆祝");
         }
         else if(param1 == 286)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("雪战服务器"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("雪战服务器");
         }
         else if(param1 == 287)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("繁华服务器"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("繁华服务器");
         }
         else if(param1 == 288)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Thưởng Quà Đại Lễ",this.onTabClick);
            titleText = "Thưởng Quà Đại Lễ";
         }
         else if(param1 == 290)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Mùa Hè Sôi Động",this.onTabClick);
            titleText = "Mùa Hè Sôi Động";
         }
         else if(param1 == 292)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("浏览-SS1"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("浏览-SS1");
         }
         else if(param1 == 294)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("2023新手活动"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("2023新手活动");
         }
         else if(param1 == 295)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Lễ Hội Hoá Trang",this.onTabClick);
            titleText = "Lễ Hội Hoá Trang";
         }
         else if(param1 == 296)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Đón Xuân",this.onTabClick);
            titleText = "Đón Xuân";
         }
         else if(param1 == 297)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Đổi Thưởng Tết",this.onTabClick);
            titleText = "Đổi Thưởng Tết";
         }
         else if(param1 == 298)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Tết Nguyên Tiêu",this.onTabClick);
            titleText = "Tết Nguyên Tiêu";
         }
         else if(param1 == 299)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Miễn Phí 04/04",this.onTabClick);
            titleText = "Miễn Phí 04/04";
         }
         else if(param1 == 300)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Level UP",this.onTabClick);
            titleText = "Level UP";
         }
         else if(param1 == 301)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Ưu Đãi",this.onTabClick);
            titleText = "Ưu Đãi";
         }
         else if(param1 == 302)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Hồi Mộng Các",this.onTabClick);
            titleText = "Hồi Mộng Các";
         }
         else if(param1 == 303)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton("Chi Mộng Lệnh",this.onTabClick);
            titleText = "Chi Mộng Lệnh";
         }
         else
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("限时大奖兑换"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("永久活动"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("高级装备"),this.onTabClick);
            titleText = LanResManager.getLanCommonTextWords("限时大奖兑换");
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("永久活动3"),this.onTabClick);
            this.tabBar.addButton("Chi Mộng Trân Phẩm",this.onTabClick);
            this.tabBar.addButton("Vương Giả",this.onTabClick);
         }
      }
      
      public function setTabClick(param1:int) : void
      {
         if(param1 == 20)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("新手活动"));
         }
         else if(param1 == 21)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("特殊活动"));
         }
         else if(param1 == 22)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("武林神兵"));
         }
         else if(param1 == 23)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("金身"));
         }
         else if(param1 == 25)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("三八活动"));
         }
         else if(param1 == 26)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("情人节玫瑰"));
         }
         else if(param1 == 27)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("永久活动3"));
         }
         else if(param1 == 28)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("玄说矿石"));
         }
         else if(param1 == 29)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("神兵不可思议"));
         }
         else if(param1 == 30)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("傲神神龙"));
         }
         else if(param1 == 31)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("锻打神器"));
         }
         else if(param1 == 32)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("王者武装"));
         }
         else if(param1 == 33)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("血风"));
         }
         else if(param1 == 34)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("雄王活动"));
         }
         else if(param1 == 35)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("显赫战功"));
         }
         else if(param1 == 36)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("解放日活动"));
         }
         else if(param1 == 37)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("五一活动"));
         }
         else if(param1 == 38)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("优惠活动"));
         }
         else if(param1 == 40)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("超级强化"));
         }
         else if(param1 == 41)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("519优惠"));
         }
         else if(param1 == 42)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("降龙护体"));
         }
         else if(param1 == 43)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("欧洲足球"));
         }
         else if(param1 == 44)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("儿童节活动"));
         }
         else if(param1 == 45)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("儿童节称号"));
         }
         else if(param1 == 46)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("61活动"));
         }
         else if(param1 == 47)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("欧洲足球2"));
         }
         else if(param1 == 48)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("灭蜜蜂"));
         }
         else if(param1 == 49)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("端午节"));
         }
         else if(param1 == 50)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("毕方出世"));
         }
         else if(param1 == 51)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("每天优惠2"));
         }
         else if(param1 == 52)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("超级强化2"));
         }
         else if(param1 == 53)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("2016足球"));
         }
         else if(param1 == 54)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("旗色衣色"));
         }
         else if(param1 == 55)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("知恩"));
         }
         else if(param1 == 56)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("追龙血杀"));
         }
         else if(param1 == 57)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("龙晶之宝"));
         }
         else if(param1 == 58)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("争斗"));
         }
         else if(param1 == 59)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("武装互助"));
         }
         else if(param1 == 60)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("开战"));
         }
         else if(param1 == 61)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("王帮"));
         }
         else if(param1 == 62)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("送满心爱"));
         }
         else if(param1 == 63)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("夏天快乐"));
         }
         else if(param1 == 64)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("恍如隔世"));
         }
         else if(param1 == 65)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("四灵大战"));
         }
         else if(param1 == 66)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("打造神兵"));
         }
         else if(param1 == 67)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("天定魂魄"));
         }
         else if(param1 == 68)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("龙晶礼包"));
         }
         else if(param1 == 69)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("总决赛兑换"));
         }
         else if(param1 == 70)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("高手无双"));
         }
         else if(param1 == 71)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("圣战士"));
         }
         else if(param1 == 72)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("烈火圣蝎"));
         }
         else if(param1 == 74)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("五绝功法"));
         }
         else if(param1 == 75)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("神秘礼物"));
         }
         else if(param1 == 76)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("魂牵梦"));
         }
         else if(param1 == 77)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("乐心出击"));
         }
         else if(param1 == 78)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("周一活动"));
         }
         else if(param1 == 79)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("周二活动"));
         }
         else if(param1 == 80)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("周三活动"));
         }
         else if(param1 == 81)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("周四活动"));
         }
         else if(param1 == 82)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("周五活动"));
         }
         else if(param1 == 83)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("周六活动"));
         }
         else if(param1 == 84)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("周日活动"));
         }
         else if(param1 == 85)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("每日优惠3"));
         }
         else if(param1 == 86)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("盂兰盒节"));
         }
         else if(param1 == 87)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("精髓东霞"));
         }
         else if(param1 == 88)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("开真元"));
         }
         else if(param1 == 89)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("七子全真教"));
         }
         else if(param1 == 90)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("八月底"));
         }
         else if(param1 == 91)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("降龙晶"));
         }
         else if(param1 == 92)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("七剑英雄"));
         }
         else if(param1 == 93)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("国庆活动"));
         }
         else if(param1 == 94)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("襄阳月色"));
         }
         else if(param1 == 99)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("群英取回"));
         }
         else if(param1 == 100)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("武神"));
         }
         else if(param1 == 101)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("西川红棉白花袍"));
         }
         else if(param1 == 102)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("神秘礼包"));
         }
         else if(param1 == 103)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("开真元2"));
         }
         else if(param1 == 172)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("开真元3"));
         }
         else if(param1 == 104)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("夏天快乐2"));
         }
         else if(param1 == 159)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("夏天快乐3"));
         }
         else if(param1 == 160)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("夏天快乐4"));
         }
         else if(param1 == 105)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("王者争雄"));
         }
         else if(param1 == 106)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("终极坐骑神丹"));
         }
         else if(param1 == 107)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("坐骑赔偿"));
         }
         else if(param1 == 108)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("强化之神2"));
         }
         else if(param1 == 109)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("王帮出战"));
         }
         else if(param1 == 110)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("维系礼包"));
         }
         else if(param1 == 111)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("九月底"));
         }
         else if(param1 == 112)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("穷尽战意"));
         }
         else if(param1 == 113)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("强化之神3"));
         }
         else if(param1 == 114)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("强化之神4"));
         }
         else if(param1 == 115)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("武神2"));
         }
         else if(param1 == 116)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("龙晶2"));
         }
         else if(param1 == 117)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("终极坐骑神丹2"));
         }
         else if(param1 == 118)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("四龙天爪"));
         }
         else if(param1 == 119)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("五色朵花"));
         }
         else if(param1 == 120)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("越南妇女节"));
         }
         else if(param1 == 121)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("龙魂"));
         }
         else if(param1 == 164)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("龙魂2"));
         }
         else if(param1 == 165)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("龙魂3"));
         }
         else if(param1 == 122)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("战绩飘荡"));
         }
         else if(param1 == 123)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("傲剑五年"));
         }
         else if(param1 == 124)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("天马剑"));
         }
         else if(param1 == 125)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("五年之梦"));
         }
         else if(param1 == 126)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("五年之恩"));
         }
         else if(param1 == 127)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("甜蜜蛋糕"));
         }
         else if(param1 == 128)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("无尽快乐"));
         }
         else if(param1 == 129)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("八怪武神盾"));
         }
         else if(param1 == 130)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("突破武功"));
         }
         else if(param1 == 131)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("六脉剑"));
         }
         else if(param1 == 132)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("寻师学道"));
         }
         else if(param1 == 133)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("一大尊师"));
         }
         else if(param1 == 134)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("王者"));
         }
         else if(param1 == 136)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("武魂剑"));
         }
         else if(param1 == 137)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("顶峰神兽"));
         }
         else if(param1 == 138)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("天象王者"));
         }
         else if(param1 == 139)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("七色葫芦"));
         }
         else if(param1 == 140)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("伴随足球队"));
         }
         else if(param1 == 141)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("震天神器"));
         }
         else if(param1 == 142)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("龙晶章"));
         }
         else if(param1 == 143)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("飞龙晶"));
         }
         else if(param1 == 170)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("飞龙晶2"));
         }
         else if(param1 == 171)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("飞龙晶3"));
         }
         else if(param1 == 144)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("半决赛领奖"));
         }
         else if(param1 == 145)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("寻找宝藏"));
         }
         else if(param1 == 146)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("惊喜金票大奖"));
         }
         else if(param1 == 147)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("震天戟"));
         }
         else if(param1 == 148)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("华山五章"));
         }
         else if(param1 == 149)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("天雪神兵"));
         }
         else if(param1 == 150)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("桃花酒"));
         }
         else if(param1 == 162)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("桃花酒2"));
         }
         else if(param1 == 163)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("桃花酒3"));
         }
         else if(param1 == 151)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("开春万福"));
         }
         else if(param1 == 152)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("新年礼包"));
         }
         else if(param1 == 153)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("降龙超级"));
         }
         else if(param1 == 166)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("降龙超级2"));
         }
         else if(param1 == 167)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("降龙超级3"));
         }
         else if(param1 == 154)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("腾天羽"));
         }
         else if(param1 == 161)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("腾天羽2"));
         }
         else if(param1 == 155)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("威勇无双"));
         }
         else if(param1 == 156)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("无尽金锭日"));
         }
         else if(param1 == 168)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("无尽金锭日2"));
         }
         else if(param1 == 169)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("无尽金锭日3"));
         }
         else if(param1 == 157)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("雄鸡权"));
         }
         else if(param1 == 158)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("春节对联"));
         }
         else if(param1 == 173)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("盖世神龙"));
         }
         else if(param1 == 174)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("姑姑成亲"));
         }
         else if(param1 == 175)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("天玉蟾"));
         }
         else if(param1 == 176)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("天神石"));
         }
         else if(param1 == 177)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("七星装备"));
         }
         else if(param1 == 178)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("灵丹珍品1"));
         }
         else if(param1 == 179)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("灵丹珍品2"));
         }
         else if(param1 == 180)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("灵丹珍品3"));
         }
         else if(param1 == 181)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("2月底"));
         }
         else if(param1 == 182)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("襄阳对决1"));
         }
         else if(param1 == 183)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("襄阳对决2"));
         }
         else if(param1 == 184)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("无尽剑"));
         }
         else if(param1 == 185)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("英雄除暴"));
         }
         else if(param1 == 186)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("襄阳对决3"));
         }
         else if(param1 == 187)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("无毒圣阵"));
         }
         else if(param1 == 188)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("绝世佳人1"));
         }
         else if(param1 == 189)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("绝世佳人2"));
         }
         else if(param1 == 190)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("绝世佳人3"));
         }
         else if(param1 == 191)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("爱情糖果"));
         }
         else if(param1 == 192)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("中原保镖"));
         }
         else if(param1 == 193)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("天道"));
         }
         else if(param1 == 194)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("追寻降龙"));
         }
         else if(param1 == 195)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("3月底"));
         }
         else if(param1 == 196)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("圣火"));
         }
         else if(param1 == 197)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("神风"));
         }
         else if(param1 == 198)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("武林至宝"));
         }
         else if(param1 == 199)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("第五次王者之帮"));
         }
         else if(param1 == 200)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("不灭朱雀"));
         }
         else if(param1 == 201)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("精英聚会"));
         }
         else if(param1 == 202)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("全龙"));
         }
         else if(param1 == 203)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("武林秘籍"));
         }
         else if(param1 == 204)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("四月底"));
         }
         else if(param1 == 205)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("战神中原"));
         }
         else if(param1 == 206)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("大节优惠"));
         }
         else if(param1 == 207)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("武林大战"));
         }
         else if(param1 == 208)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("万毒灵"));
         }
         else if(param1 == 209)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("江湖论武"));
         }
         else if(param1 == 210)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("五毒圣镇"));
         }
         else if(param1 == 211)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("唐门绝技"));
         }
         else if(param1 == 212)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("炼宝剑"));
         }
         else if(param1 == 213)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("建设襄阳"));
         }
         else if(param1 == 214)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("狂暴"));
         }
         else if(param1 == 215)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("灭虫"));
         }
         else if(param1 == 216)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("活跃"));
         }
         else if(param1 == 217)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("金叶"));
         }
         else if(param1 == 218)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("放风筝"));
         }
         else if(param1 == 219)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("彻武权"));
         }
         else if(param1 == 220)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("神兽古墓"));
         }
         else if(param1 == 221)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("飞龙肾宝"));
         }
         else if(param1 == 222)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("战争"));
         }
         else if(param1 == 223)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("补偿"));
         }
         else if(param1 == 224)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("魔兵进攻"));
         }
         else if(param1 == 225)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("古墓争斗"));
         }
         else if(param1 == 226)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("牛郎织女"));
         }
         else if(param1 == 227)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("英雄战"));
         }
         else if(param1 == 228)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("桥连救母"));
         }
         else if(param1 == 229)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("开学气球"));
         }
         else if(param1 == 230)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("精英比才"));
         }
         else if(param1 == 231)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("六剑"));
         }
         else if(param1 == 232)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("中秋活动"));
         }
         else if(param1 == 233)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("五毒奇人"));
         }
         else if(param1 == 234)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("2017越南妇女节"));
         }
         else if(param1 == 235)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("2017维系武林"));
         }
         else if(param1 == 236)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("化妆活动"));
         }
         else if(param1 == 237)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("商人20171101"));
         }
         else if(param1 == 238)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("随心消费"));
         }
         else if(param1 == 239)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("望季典礼"));
         }
         else if(param1 == 240)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("堆雪人"));
         }
         else if(param1 == 241)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("5区新手好礼"));
         }
         else if(param1 == 242)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("出战活动"));
         }
         else if(param1 == 243)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("更新补偿活动"));
         }
         else if(param1 == 244)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("2018祭灶节"));
         }
         else if(param1 == 245)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("2018年灶爷"));
         }
         else if(param1 == 246)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("三合活动"));
         }
         else if(param1 == 247)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("新手活动2018"));
         }
         else if(param1 == 248)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("女儿赠送"));
         }
         else if(param1 == 249)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("情人节还礼"));
         }
         else if(param1 == 250)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("五色汤圆"));
         }
         else if(param1 == 251)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("夏日水果"));
         }
         else if(param1 == 252)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("飞升境界"));
         }
         else if(param1 == 253)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("世界杯2018"));
         }
         else if(param1 == 254)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("不败金身"));
         }
         else if(param1 == 255)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("要诀"));
         }
         else if(param1 == 256)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("版本累计"));
         }
         else if(param1 == 257)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("补偿1"));
         }
         else if(param1 == 258)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("兑换功能"));
         }
         else if(param1 == 259)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("幸运星星"));
         }
         else if(param1 == 260)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("英雄活动"));
         }
         else if(param1 == 261)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("酿酒活动"));
         }
         else if(param1 == 263)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("迎接国庆"));
         }
         else if(param1 == 264)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("四贵周期"));
         }
         else if(param1 == 265)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("中秋甜饼"));
         }
         else if(param1 == 266)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("收集古物"));
         }
         else if(param1 == 267)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("飞升境界2"));
         }
         else if(param1 == 268)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("挑战活动"));
         }
         else if(param1 == 269)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("糖果兑换"));
         }
         else if(param1 == 270)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("锻炼宝石"));
         }
         else if(param1 == 271)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("幸运因素"));
         }
         else if(param1 == 272)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("冬天猎捕"));
         }
         else if(param1 == 273)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("冬天兑换"));
         }
         else if(param1 == 274)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("制造烟花"));
         }
         else if(param1 == 275)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("状王归天"));
         }
         else if(param1 == 276)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("猎手活动2"));
         }
         else if(param1 == 277)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("V400优惠"));
         }
         else if(param1 == 278)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("新兵"));
         }
         else if(param1 == 279)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("七月精英"));
         }
         else if(param1 == 280)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("抓玉兔"));
         }
         else if(param1 == 281)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("内体"));
         }
         else if(param1 == 282)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("商人2"));
         }
         else if(param1 == 283)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("精英回令"));
         }
         else if(param1 == 284)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("八年服务器"));
         }
         else if(param1 == 285)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("八年生日庆祝"));
         }
         else if(param1 == 286)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("雪战服务器"));
         }
         else if(param1 == 287)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("繁华服务器"));
         }
         else if(param1 == 288)
         {
            this.onTabClick(null,"Thưởng Quà Đại Lễ");
         }
         else if(param1 == 289)
         {
            this.onTabClick(null,"Cửa Hàng Ôn Luyện");
         }
         else if(param1 == 290)
         {
            this.onTabClick(null,"Mùa Hè Sôi Động");
         }
         else if(param1 == 291)
         {
            this.onTabClick(null,"Chi Mộng Trân Phẩm");
         }
         else if(param1 == 292)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("浏览-SS1"));
         }
         else if(param1 == 293)
         {
            this.onTabClick(null,"Vương Giả");
         }
         else if(param1 == 294)
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("2023新手活动"));
         }
         else if(param1 == 295)
         {
            this.onTabClick(null,"Lễ Hội Hoá Trang");
         }
         else if(param1 == 296)
         {
            this.onTabClick(null,"Đón Xuân");
         }
         else if(param1 == 297)
         {
            this.onTabClick(null,"Đổi Thưởng Tết");
         }
         else if(param1 == 298)
         {
            this.onTabClick(null,"Tết Nguyên Tiêu");
         }
         else if(param1 == 299)
         {
            this.onTabClick(null,"Miễn Phí 04/04");
         }
         else if(param1 == 300)
         {
            this.onTabClick(null,"Level UP");
         }
         else if(param1 == 301)
         {
            this.onTabClick(null,"Ưu Đãi");
         }
         else if(param1 == 302)
         {
            this.onTabClick(null,"Hồi Mộng Các");
         }
         else if(param1 == 303)
         {
            this.onTabClick(null,"Chi Mộng Lệnh");
         }
         else
         {
            this.onTabClick(null,LanResManager.getLanCommonTextWords("限时大奖兑换"));
         }
      }
   }
}

