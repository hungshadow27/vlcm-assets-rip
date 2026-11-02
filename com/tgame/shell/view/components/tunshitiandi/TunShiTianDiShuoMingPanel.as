package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class TunShiTianDiShuoMingPanel extends FPanel
   {
      
      private var tabBar:FTabBar;
      
      private var upBtn:NewSkinButton;
      
      private var downBtn:NewSkinButton;
      
      public var tabArr:Array = [LanResManager.getLanCommonTextWords("进入条件"),LanResManager.getLanCommonTextWords("进入方式"),LanResManager.getLanCommonTextWords("选择职业"),LanResManager.getLanCommonTextWords("场景规则"),LanResManager.getLanCommonTextWords("职业技能"),LanResManager.getLanCommonTextWords("死亡复活"),LanResManager.getLanCommonTextWords("奖励结算"),LanResManager.getLanCommonTextWords("排行榜")];
      
      public var bgArr:Array = [];
      
      public var index:int = 0;
      
      public var bgSpr:Sprite;
      
      public const MAX_BG_COUNT:int = 7;
      
      public var textArr:Array = [[{
         "x":120,
         "y":65,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#0cff00\'>" + LanResManager.getLanCommonTextWords("开启时间：每天 10:00-23:00") + "</FONT>"
      },{
         "x":420,
         "y":250,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("必须有弟子角色") + "</FONT>"
      }],[{
         "x":100,
         "y":225,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("弟子角色打开吞食天地") + "</FONT>"
      },{
         "x":100,
         "y":295,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("点击前往战斗") + "</FONT>"
      }],[{
         "x":50,
         "y":105,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("红方队员") + "</FONT>"
      },{
         "x":680,
         "y":135,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("弟子名称") + "</FONT>"
      },{
         "x":680,
         "y":175,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("选择职业倒计时") + "</FONT>"
      },{
         "x":18,
         "y":312,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("系统将为您随机一个职业") + "</FONT>"
      },{
         "x":680,
         "y":305,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("在弹出的面板中") + "<br>" + LanResManager.getLanCommonTextWords("选择您喜欢的职业") + "</FONT>"
      },{
         "x":50,
         "y":222,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("蓝方队员") + "</FONT>"
      }],[{
         "x":500,
         "y":40,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("四个职业分别对应的技能点为：") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#ff0000\'> " + LanResManager.getLanCommonTextWords("少林派弟子 — 红色") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#ffff00\'> " + LanResManager.getLanCommonTextWords("全真派弟子 — 黄色") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#006cff\'> " + LanResManager.getLanCommonTextWords("古墓派弟子 — 蓝色") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#00ff00\'> " + LanResManager.getLanCommonTextWords("桃花岛弟子 — 绿色") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("技能点触碰即可获得，每个门派的弟子只可") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#ffffff\'>" + LanResManager
         .getLanCommonTextWords("获得该门派对应的技能点。") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#ffffff\'> " + LanResManager.getLanCommonTextWords("积分点 所有门派的弟子均可进行采集。") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#ffffff\'></FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#fcff00\'>" + LanResManager.getLanCommonTextWords("整个地图是以台子形式出现的，通过跳跃移到其他的点。") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#fcff00\'>" + LanResManager.getLanCommonTextWords("地图中有两层阻挡，阻挡有时间限制，阻挡开启会有系统提示。") + "</FONT></FONT><br/><FONT   SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#fcff00\'>" + LanResManager.getLanCommonTextWords("每个台子中央随机刷出积分点或四个职业的技能点。") + "</FONT>"
      }],[{
         "x":650,
         "y":132,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("当前自己所在的队伍") + "</FONT>"
      },{
         "x":60,
         "y":90,
         "txt":"<FONT   SIZE=\'14\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#f0ff00\'></FONT></FONT><br/><FONT   SIZE=\'14\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#f0ff00\'>" + LanResManager.getLanCommonTextWords("吃技能点将会增加此进度条，") + "</FONT></FONT><br/><FONT   SIZE=\'14\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#f0ff00\'>" + LanResManager.getLanCommonTextWords("当为100%时将激活技能栏中 2、3、4位") + "</FONT></FONT><FONT   SIZE=\'14\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#f0ff00\'>" + LanResManager.getLanCommonTextWords("置的3个技能，3个技能同时为1级；") + "</FONT></FONT><br/><FONT   SIZE=\'14\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#f0ff00\'>" + LanResManager.getLanCommonTextWords("当进度为200%时，这三个技能同时为2级") + "</FONT></FONT><br/><FONT   SIZE=\'14\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#f0ff00\'>" + LanResManager
         .getLanCommonTextWords("当进度为300%时，这三个技能同时为3级。") + "</FONT></FONT><br/><FONT   SIZE=\'14\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#f0ff00\'>" + LanResManager.getLanCommonTextWords("技能最高等级为3级。") + "</FONT></FONT><br/><FONT   SIZE=\'14\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT SIZE=\'14\' COLOR=\'#f0ff00\'>" + LanResManager.getLanCommonTextWords("鼠标移到进度条上会显示您的职业。") + "</FONT>"
      },{
         "x":650,
         "y":175,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("查看队友的职业") + "</FONT>"
      }],[{
         "x":22,
         "y":260,
         "txt":"<FONT  SIZE=\'16\' COLOR=\'#0179ff\'>" + "        " + LanResManager.getLanCommonTextWords("蓝方复活") + "</FONT></FONT>\t\t\t\t\t\t<br><FONT  SIZE=\'14\' COLOR=\'#0179ff\'>" + LanResManager.getLanCommonTextWords("蓝方队友死亡后将在此区域复活") + "</FONT>"
      },{
         "x":600,
         "y":260,
         "txt":"<FONT  SIZE=\'16\' COLOR=\'#ff0000\'>" + "        " + LanResManager.getLanCommonTextWords("红方复活") + "</FONT></FONT>\t\t\t\t\t\t<br><FONT  SIZE=\'14\' COLOR=\'#ff0000\'>" + LanResManager.getLanCommonTextWords("红方队友死亡后将在此区域复活") + "</FONT>"
      }],[{
         "x":110,
         "y":250,
         "txt":"<FONT   SIZE=\'14\' COLOR=\'#fffc00\'>" + LanResManager.getLanCommonTextWords("胜方每人获得100积分;败方每人获得50积分;当一方队友人数为0，则另一队自动胜出，获得奖励为每人50积分。平局则双方队伍每人获得50积分。") + "</FONT>"
      },{
         "x":80,
         "y":40,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#0cff00\'>" + LanResManager.getLanCommonTextWords("副本倒计时最后一分钟弹结算界面") + "</FONT>"
      },{
         "x":110,
         "y":220,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#0cff00\'>" + LanResManager.getLanCommonTextWords("各队员获得积分总数") + "</FONT>"
      },{
         "x":455,
         "y":335,
         "txt":"<FONT SIZE=\'14\' COLOR=\'#0cff00\'>" + LanResManager.getLanCommonTextWords("两队在地图中获得的总计分对比") + "</FONT>"
      }],[{
         "x":20,
         "y":140,
         "txt":"<FONT   SIZE=\'14\' COLOR=\'#fffc00\'>" + LanResManager.getLanCommonTextWords("排行榜中的排名会在每") + "<br>" + LanResManager.getLanCommonTextWords("个礼拜一进行清理。届") + "<br>" + LanResManager.getLanCommonTextWords("时将清除所有排名和奖") + "<br>" + LanResManager.getLanCommonTextWords("励，为了避免造成损失") + "<br>" + LanResManager.getLanCommonTextWords("请您及时领取奖励。") + "</FONT>"
      },{
         "x":610,
         "y":100,
         "txt":"<FONT COLOR=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("积分值将会在排行榜中结算，每个") + "</FONT></FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT COLOR=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("星期日对应名次可以在主界面“领") + "</FONT></FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT COLOR=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("取奖励”中领取对应的奖励。") + "</FONT></FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT COLOR=\'#ff7e00\'>" + LanResManager.getLanCommonTextWords("第1名可领取1000积分;") + "</FONT></FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT COLOR=\'#ffb401\'>" + LanResManager.getLanCommonTextWords("第2，第3名可领取800积分;") + "</FONT></FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT COLOR=\'#ffe400\'>" + LanResManager.getLanCommonTextWords("第4至第10名可领取600积分;") + "</FONT></FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'>" + LanResManager
         .getLanCommonTextWords("第11至第50名可领取400积分;") + "</FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT COLOR=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("积分领取时间:") + "</FONT></FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT COLOR=\'#00ff1e\'>" + LanResManager.getLanCommonTextWords("每周日") + " 6:00~24:00</FONT></FONT><br/><FONT  SIZE=\'12\' COLOR=\'#9ef802\' LETTERSPACING=\'0\' KERNING=\'1\'><FONT COLOR=\'#ffffff\'>" + LanResManager.getLanCommonTextWords("使用积分在“积分商城”中购买物品") + "</FONT></FONT>"
      }]];
      
      public function TunShiTianDiShuoMingPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 290 + 550 + 3 + 15 - 3 - 4;
         height = 365 + 35 + 80 + 15 - 3 - 1;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("吞食天地规则");
         this.tabBar = new FTabBar();
         var _loc1_:int = 0;
         while(_loc1_ < this.tabArr.length)
         {
            this.tabBar.addButton(this.tabArr[_loc1_],this.onTabClick);
            _loc1_++;
         }
         addChild(this.tabBar);
         this.tabBar.x = 16;
         this.tabBar.y = 8;
         this.bgSpr = new Sprite();
         this.bgSpr.x = 14;
         this.bgSpr.y = 28;
         addChild(this.bgSpr);
         this.upBtn = new NewSkinButton();
         this.upBtn.skin = "shangYiYe_Button";
         this.upBtn.x = 270;
         this.upBtn.y = 398;
         addChild(this.upBtn);
         this.upBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.downBtn = new NewSkinButton();
         this.downBtn.skin = "xiaYiYe_Button";
         this.downBtn.x = 460;
         this.downBtn.y = 398;
         addChild(this.downBtn);
         this.downBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.upBtn:
               this.showBgByIndex(this.index - 1);
               break;
            case this.downBtn:
               this.showBgByIndex(this.index + 1);
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         var _loc2_:String = (param1.target as FButton).label;
         var _loc3_:int = 0;
         while(_loc3_ < this.tabArr.length)
         {
            if(_loc2_ == this.tabArr[_loc3_])
            {
               this.showBgByIndex(_loc3_);
               return;
            }
            _loc3_++;
         }
      }
      
      public function setTabLable() : void
      {
         this.tabBar.setCurrentButtonByLabel(this.tabArr[this.index]);
      }
      
      public function showBgByIndex(param1:int) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:Object = null;
         var _loc5_:FTextArea = null;
         if(param1 == 0)
         {
            this.upBtn.enabled = false;
         }
         else
         {
            this.upBtn.enabled = true;
         }
         if(param1 == this.MAX_BG_COUNT)
         {
            this.downBtn.enabled = false;
         }
         else
         {
            this.downBtn.enabled = true;
         }
         this.index = param1;
         this.setTabLable();
         while(this.bgSpr.numChildren != 0)
         {
            this.bgSpr.removeChildAt(0);
         }
         if(this.bgArr[this.index] != null)
         {
            this.bgSpr.addChild(this.bgArr[this.index]);
         }
         else
         {
            _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/shuoming" + this.index + ".swf");
            this.bgSpr.addChild(_loc3_);
            this.bgArr[this.index] = _loc3_;
         }
         var _loc2_:Array = this.textArr[this.index];
         if(_loc2_ != null)
         {
            param1 = 0;
            while(param1 < _loc2_.length)
            {
               _loc4_ = _loc2_[param1];
               _loc5_ = new FTextArea();
               _loc5_.filters = StaticValue.filter;
               _loc5_.autoSize = TextFieldAutoSize.LEFT;
               _loc5_.x = _loc4_.x;
               _loc5_.y = _loc4_.y;
               _loc5_.wordWrap = true;
               _loc5_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc4_.txt + "</font>";
               _loc5_.width = 220;
               _loc5_.height = 500;
               this.bgSpr.addChild(_loc5_);
               param1++;
            }
         }
      }
   }
}

