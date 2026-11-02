package com.tgame.shell.view.components.yitiantulong
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class jinruBaituoshanPanel extends Sprite
   {
      
      public static const UI_JINRUBAITUOSHAN_CLICK:String = "UI_JINRUBAITUOSHAN_CLICK";
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var trueBtn:FSimpleButton;
      
      private var thinkBtn:FSimpleButton;
      
      public function jinruBaituoshanPanel()
      {
         var bg:DisplayObject;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/baituoshanjiguan/skin.swf");
         bg.x = 0;
         bg.y = 0;
         addChild(bg);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 264;
            y = 127 - 12;
            width = 380;
            height = 200;
            multiline = true;
            wordWrap = true;
            htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\' size=\'12\'>" + LanResManager.getLanCommonTextWords("您已经打开了去往白驼山的机关，您要继续前进吗？") + "</font>";
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 264;
            y = 70 + 84 + 7;
            width = 291 - 10;
            height = 54;
            multiline = true;
            wordWrap = true;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("注不可以组队进入，如果您在队伍中我们将帮助您直接退出队伍，白驼山沼气甚重，不宜使用夫妻传入功能。");
         }
         addChild(this.fta2);
         this.trueBtn = new FSimpleButton();
         this.trueBtn.skin = "baituoshanQianjinButton";
         this.trueBtn.x = 80 + 247 + 15;
         this.trueBtn.y = 150 + 79;
         addChild(this.trueBtn);
         this.trueBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.thinkBtn = new FSimpleButton();
         this.thinkBtn.skin = "baituoshanLikaiButton";
         this.thinkBtn.x = 240 + 225;
         this.thinkBtn.y = 150 + 79;
         addChild(this.thinkBtn);
         this.thinkBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_JINRUBAITUOSHAN_CLICK));
         this.onClose();
      }
      
      private function onClose(param1:MouseEvent = null) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

