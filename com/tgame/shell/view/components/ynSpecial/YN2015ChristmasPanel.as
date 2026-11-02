package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YN2015ChristmasPanel extends FPanel
   {
      
      public static const UI_YN_CHRISTMAS_CLICK:String = "UI_YN_CHRISTMAS_CLICK";
      
      private var ft:FTextArea;
      
      private var bg:DisplayObject;
      
      private var btn:FSimpleButton;
      
      private var itemBg:DisplayObject;
      
      private var font:DisplayObject;
      
      public function YN2015ChristmasPanel()
      {
         super();
         width = 550;
         height = 460;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("圣诞节");
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
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2015xinnian/bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.font = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2015xinnian/font.swf");
         this.font.x = 70;
         this.font.y = 40;
         addChild(this.font);
         var _loc1_:Array = [711984,711985,711986,711987];
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            this.itemBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2015xinnian/itemBg.swf");
            this.itemBg.x = 300;
            this.itemBg.y = 20 + 100 * _loc2_;
            addChild(this.itemBg);
            this.btn = new FSimpleButton();
            this.btn.name = String(_loc2_ + 1);
            this.btn.skin = "yn2015ChristmasBtn_lq";
            this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.btn.x = 380;
            this.btn.y = 20 + 100 * _loc2_;
            addChild(this.btn);
            _loc3_ = new Goods(int(_loc1_[_loc2_]));
            _loc4_ = new ItemFace(_loc3_,65,65);
            _loc4_.x = 302;
            _loc4_.y = 22 + 100 * _loc2_;
            _loc4_.setShowCount(true);
            addChild(_loc4_);
            _loc2_++;
         }
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[47,param1.target.name]);
      }
   }
}

