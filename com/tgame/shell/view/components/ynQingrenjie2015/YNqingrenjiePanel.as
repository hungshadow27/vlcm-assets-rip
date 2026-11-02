package com.tgame.shell.view.components.ynQingrenjie2015
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YNqingrenjiePanel extends FPanel
   {
      
      private var bg1:DisplayObject;
      
      private var xin:DisplayObject;
      
      private var word:DisplayObject;
      
      private var songhuaBtn:SecondButton;
      
      private var paihangBtn:SecondButton;
      
      private var ty:int = 1;
      
      public function YNqingrenjiePanel()
      {
         super();
         skin = "panel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 505 - 20;
         height = 420 - 20;
         titleText = LanResManager.getLanCommonTextWords("情人节活动");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.songhuaBtn = new SecondButton();
         this.songhuaBtn.x = width / 2 - width / 2 / 2 - this.songhuaBtn.width / 2;
         this.songhuaBtn.y = 352 - 20;
         addChild(this.songhuaBtn);
         this.songhuaBtn.label = LanResManager.getLanCommonTextWords("送花");
         this.songhuaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.paihangBtn = new SecondButton();
         this.paihangBtn.x = width / 2 + width / 2 / 2 - this.paihangBtn.width / 2 - 20;
         this.paihangBtn.y = 352 - 20;
         addChild(this.paihangBtn);
         this.paihangBtn.label = LanResManager.getLanCommonTextWords("人气榜");
         this.paihangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.songhuaBtn:
               PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,this.ty);
               break;
            case this.paihangBtn:
               PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIE_SONGHUABANG_PLANE);
         }
      }
      
      public function setType(param1:int = 1) : void
      {
         this.ty = param1;
         if(param1 == 1)
         {
            this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/2015chunjie/qrj_bg.swf");
            this.xin = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/2015chunjie/qrj_heart.swf");
            this.word = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/2015chunjie/qrj_word.swf");
            this.word.x = 40;
            addChild(this.bg1);
            addChild(this.xin);
            addChild(this.word);
            this.xin.x = 2 - 80;
            this.xin.y = 2 - 60;
         }
         else if(param1 == 3)
         {
            this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/2015chunjie/38jie_bg.swf");
            this.xin = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/2015chunjie/38jie_hua.swf");
            this.xin.x = 2 - 80 + 50;
            this.xin.y = 2 - 60 - 55;
            addChild(this.bg1);
            addChild(this.xin);
         }
         this.bg1.x = 2 + 7;
         this.bg1.y = 2;
      }
   }
}

