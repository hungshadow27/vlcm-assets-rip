package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class BiWuZhaoQinPanel extends FPanel
   {
      
      public static const JINRUCHANGDI_CLICK:String = "JINRUCHANGDI_CLICK";
      
      private var jinRuBtn:SecondButton;
      
      private var ft1:FTextArea;
      
      private var nameFt:FTextArea;
      
      private var girlSp:Sprite;
      
      private var girlDis:DisplayObject;
      
      private var miaoshuFt:FTextArea;
      
      private var bg:DisplayObject;
      
      public function BiWuZhaoQinPanel()
      {
         var line:Bitmap = null;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 296;
         height = 475;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("比武招亲");
         this.girlSp = new Sprite();
         this.girlSp.x = 65 + 17;
         this.girlSp.y = 2;
         addChild(this.girlSp);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shicong/zhaoqinzhe.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.nameFt = new FTextArea();
         with(this.nameFt)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 93;
            y = 10;
            htmlText = "";
         }
         addChild(this.nameFt);
         this.miaoshuFt = new FTextArea();
         with(this.miaoshuFt)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 10;
            y = 283;
            htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("比武招亲") + "<br>" + LanResManager.getLanCommonTextWords("开放时间：") + "</font>" + LanResManager.getLanCommonTextWords("每天14:00-14:30、21:00-21:30") + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("进入限制：") + "</font>" + LanResManager.getLanCommonTextWords("需要入场券一枚，该场地仅容纳200名玩") + "<br>" + LanResManager.getLanCommonTextWords("家，200名之后的玩家将无法进入场地。") + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("比武规则：") + "</font>" + LanResManager.getLanCommonTextWords("进入场地后，争夺战场中央的绣球，活") + "<br>" + LanResManager.getLanCommonTextWords("动结束时持有绣球的玩家将会获得本场活动的美人") + "<br>" + LanResManager.getLanCommonTextWords("侍从") + "</font>";
         }
         addChild(this.miaoshuFt);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.width = 258;
         addChild(line);
         line.x = 15;
         line.y = 279;
         this.jinRuBtn = new SecondButton();
         this.jinRuBtn.label = LanResManager.getLanCommonTextWords("进入场地");
         addChild(this.jinRuBtn);
         this.jinRuBtn.x = 114;
         this.jinRuBtn.y = 410;
         this.jinRuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
         dispatchEvent(new Event(JINRUCHANGDI_CLICK));
      }
      
      public function setGirlName(param1:String) : void
      {
         this.nameFt.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1 + "</font>";
      }
      
      public function setGirlPicture(param1:int) : void
      {
         while(this.girlSp.numChildren > 0)
         {
            this.girlSp.removeChildAt(0);
         }
         this.girlDis = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shicong/" + param1 + ".swf");
         this.girlSp.addChild(this.girlDis);
      }
   }
}

