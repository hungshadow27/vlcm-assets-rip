package com.tgame.shell.view.components.system
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class KeyboardShortcutsCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var tip:FTextArea;
      
      public var bgImg:Bitmap;
      
      public function KeyboardShortcutsCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.system.option.key.ui";
         addChild(this.bgImg);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 100;
            height = 350;
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 12;
            y = 6;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'5\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "ESC<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "A<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "X<br>" + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "Z<br>" + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "CTRL+Z<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "~<br>" + "</font>" + "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("空格键") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "W<br>" + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + "SHIFT+" + LanResManager.getLanCommonTextWords("鼠标左键") + "<br>" + "</font>" + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + "SHTFT+" + LanResManager.getLanCommonTextWords("鼠标左键") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + "CTRL+" + LanResManager
            .getLanCommonTextWords("鼠标左键") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "J<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("数字") + "1-0<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "CTRL+" + LanResManager.getLanCommonTextWords("数字") + "1-5<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "R<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "E<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "I<br>" + "</font>" + "</textformat>";
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            width = 200;
            height = 350;
            x = 117;
            y = 6;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'5\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("取消任何当前操作") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打开领取闭关经验与闭关真气界面") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开始打坐修炼（可获得经验与真气）") + "<br>" + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("开始/结束自动挂机战斗") + "<br>" + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("打开挂机战斗设置界面") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("快速选择下一个攻击目标") + "<br>" + "</font>" + "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("快速拾取怪物掉落的物品") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("骑上/收起我的坐骑") + "<br>" + "</font>" + "<font color=\'" + StaticValue
            .RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("点在场景空地上，则人物跳跃至该处") + "<br>" + "</font>" + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点在其他玩家身上，则可发起强制PK") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("点在其他玩家身上，则可发起强制PK") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("暂无") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用主角武功") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用坐骑技能") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("缩/放聊天信息窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("显/隐其他玩家的造型") + "<br>" + "</font>" + "<font color=\'" + StaticValue
            .WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("显/隐其他玩家的名字") + "</font>" + "</textformat>";
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 45;
            height = 350 + 15;
            x = 337;
            y = 6;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'5\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "M<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "K<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "C<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "D<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "B<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "V<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "N<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "Q<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "T<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "F<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "G<br>" + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "O<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "S<br>" + "</font>" + "<font color=\'" + StaticValue
            .WHITE_HTML + "\'>" + "Y<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "CTRL+Y<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "CTRL+~<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "P" + "</font>" + "</textformat>";
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            width = 60;
            height = 350 + 15;
            x = 387;
            y = 6;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'5\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("世界地图") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("排行榜") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("角色成就") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("随身背包") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功列表") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("坐骑属性") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务信息") + "<br>" + "</font>" + "<font color=\'" + StaticValue
            .WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("组队信息") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("好友列表") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帮会") + "<br>" + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("VIP商城") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("系统设置") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开/关音乐") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开/关音效") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("暂无") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("开/关翅膀") + "</font>" + "</textformat>";
         }
         addChild(this.tip);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
   }
}

