package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNLuohanhutiPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var spr:Sprite;
      
      private var selectSpr:Sprite;
      
      private var goArr:Array = [724292,724303,724314,724325,724336,724347,724358,724369,724380,724391,724402,724413,724424,724435,724446,724457,724468,724479];
      
      private var selectID:int = -1;
      
      private var selectMC:DisplayObject;
      
      public function YNLuohanhutiPanel()
      {
         super();
         width = 671;
         height = 246;
         dragAble = true;
         showCloseButton = true;
         skin = "panel";
         titleText = LanResManager.getLanCommonTextWords("罗汉护体");
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
         var _loc4_:int = 0;
         var _loc5_:ItemFace = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/201638huodong/luohan_bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.spr = new Sprite();
         addChild(this.spr);
         this.selectSpr = new Sprite();
         addChild(this.selectSpr);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 2)
         {
            _loc4_ = 0;
            while(_loc4_ < 9)
            {
               _loc5_ = new ItemFace(new Goods(int(this.goArr[_loc2_])),65,65);
               _loc5_.x = 25 + 70 * _loc4_;
               _loc5_.y = 20 + 74 * _loc3_;
               _loc5_.name = this.goArr[_loc2_];
               _loc5_.addEventListener(MouseEvent.CLICK,this.onItemClick);
               this.spr.addChild(_loc5_);
               _loc2_++;
               _loc4_++;
            }
            _loc3_++;
         }
         this.btn = new SecondButton();
         this.btn.x = 315;
         this.btn.y = 180;
         this.btn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[64,this.selectID]);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         if(this.selectSpr.getChildByName("selectMC"))
         {
            this.selectSpr.removeChild(this.selectMC);
         }
         this.selectID = int(_loc2_.name);
         this.selectMC = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016yuanxiaojie/select.swf");
         this.selectMC.name = "selectMC";
         this.selectMC.x = _loc2_.x - 2;
         this.selectMC.y = _loc2_.y - 2;
         this.selectSpr.addChild(this.selectMC);
      }
   }
}

