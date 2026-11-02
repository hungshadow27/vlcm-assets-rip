package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.text.TextFormat;
   
   public class YNRichangPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var bg:DisplayObject;
      
      public function YNRichangPanel()
      {
         super();
         width = 615;
         height = 381;
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("日常公告");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:TextFormat = null;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynRichang/bg.swf");
         this.bg.visible = true;
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         _loc1_ = new TextFormat();
         _loc1_.align = "center";
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 10;
         this.ft.defaultTextFormat = _loc1_;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("时间");
         this.ft.width = 82;
         this.ft.height = 20;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 38;
         this.ft.defaultTextFormat = _loc1_;
         this.ft.textColor = StaticValue.BLUE;
         this.ft.htmlText = "<textformat leading=\'10\'>" + LanResManager.getLanCommonTextWords("星期一") + "<br>" + LanResManager.getLanCommonTextWords("星期二") + "<br>" + LanResManager.getLanCommonTextWords("星期三") + "<br>" + LanResManager.getLanCommonTextWords("星期四") + "<br>" + LanResManager.getLanCommonTextWords("星期五") + "<br>" + LanResManager.getLanCommonTextWords("星期六") + "</textformat>";
         this.ft.width = 82;
         this.ft.height = 150;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 240;
         this.ft.defaultTextFormat = _loc1_;
         this.ft.textColor = StaticValue.BLUE;
         this.ft.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("星期日") + "</textformat>";
         this.ft.width = 80;
         this.ft.height = 20;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 85;
         this.ft.y = 10;
         this.ft.defaultTextFormat = _loc1_;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("功能") + "</textformat>";
         this.ft.width = 150;
         this.ft.height = 20;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 85;
         this.ft.y = 38;
         this.ft.defaultTextFormat = _loc1_;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = "<textformat leading=\'10\'>" + LanResManager.getLanCommonTextWords("跨服宋蒙战场") + "<br>" + LanResManager.getLanCommonTextWords("跨服3V3") + "<br>" + LanResManager.getLanCommonTextWords("刺客任务") + "<br>" + LanResManager.getLanCommonTextWords("所有副本") + "<br>" + LanResManager.getLanCommonTextWords("挂机打怪") + "<br>" + LanResManager.getLanCommonTextWords("押镖任务") + "<br>" + LanResManager.getLanCommonTextWords("跨服宋蒙战场") + "<br>" + LanResManager.getLanCommonTextWords("跨服3V3") + "<br>" + LanResManager.getLanCommonTextWords("刺客任务") + "<br>" + LanResManager.getLanCommonTextWords("所有副本") + "<br>" + LanResManager.getLanCommonTextWords("挂机打怪") + "<br>" + LanResManager.getLanCommonTextWords("押镖任务") + "</textformat>";
         this.ft.width = 150;
         this.ft.height = 305;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 245;
         this.ft.y = 10;
         this.ft.defaultTextFormat = _loc1_;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("加成效果") + "</textformat>";
         this.ft.width = 360;
         this.ft.height = 20;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 245;
         this.ft.y = 38;
         this.ft.defaultTextFormat = _loc1_;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = "<textformat leading=\'10\'>" + LanResManager.getLanCommonTextWords("在这天，玩家参加功能将会获得：双倍积累值") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家参加功能将会获得：三倍荣誉值") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家参加功能将会获得：双倍令银") + "<br>" + LanResManager.getLanCommonTextWords("额外获得一次免费进入副本的机会") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家挂机打怪获得：五倍经验") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家押镖将会获得：双倍奖励") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家参加功能将会获得：双倍积累值") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家参加功能将会获得：三倍荣誉值") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家参加功能将会获得：双倍令银") + "<br>" + LanResManager.getLanCommonTextWords("额外获得一次免费进入副本的机会") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家挂机打怪获得：五倍经验") + "<br>" + LanResManager.getLanCommonTextWords("在这天，玩家押镖将会获得：双倍奖励") + "</textformat>";
         this.ft.width = 360;
         this.ft.height = 305;
         this.ft.wordWrap = true;
         addChild(this.ft);
      }
   }
}

