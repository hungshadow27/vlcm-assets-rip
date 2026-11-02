package com.tgame.shell.view.components.ynSpecial
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
   
   public class YNshiertianzhiPanel extends FPanel
   {
      
      public function YNshiertianzhiPanel()
      {
         super();
         width = 555;
         height = 505;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("十二地支");
         dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc4_:SecondButton = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016yuanxiaojie/tiangandizhi_bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         var _loc2_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016yuanxiaojie/tiangandizhi_word.swf");
         _loc2_.x = 20;
         _loc2_.y = 18;
         addChild(_loc2_);
         var _loc3_:int = 0;
         while(_loc3_ < 12)
         {
            _loc4_ = new SecondButton();
            _loc4_.name = String(_loc3_ + 1);
            _loc4_.x = 480;
            _loc4_.y = 128 + 25 * _loc3_;
            _loc4_.label = LanResManager.getLanCommonTextWords("兑换");
            _loc4_.addEventListener(MouseEvent.CLICK,this.onClick);
            addChild(_loc4_);
            _loc3_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[63,param1.target.name]);
      }
   }
}

