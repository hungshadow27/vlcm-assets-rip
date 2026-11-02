package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YNchongzhidafaPanel extends FPanel
   {
      
      public static const UI_YN_CHONGZHIDAFA_LINGQU_CLICK:String = "UI_YN_CHONGZHIDAFA_LINGQU_CLICK";
      
      private var btn1:NewSkinButton;
      
      private var btn2:NewSkinButton;
      
      private var btn3:NewSkinButton;
      
      private var btn4:NewSkinButton;
      
      private var btn5:NewSkinButton;
      
      private var btn6:NewSkinButton;
      
      public function YNchongzhidafaPanel()
      {
         super();
         width = 635;
         height = 375;
         dragAble = true;
         showCloseButton = true;
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
         var _loc3_:DisplayObject = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynChongzhidafa/bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         var _loc2_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynChongzhidafa/title.swf");
         _loc2_.x = 20 - 25;
         _loc2_.y = 10 - 75;
         addChild(_loc2_);
         _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynChongzhidafa/word.swf");
         _loc3_.x = 20 + 15;
         _loc3_.y = 10 + 25;
         addChild(_loc3_);
         var _loc4_:ItemFace = new ItemFace(new Goods(721637),65,65);
         _loc4_.x = 20;
         _loc4_.y = 85 + 8;
         addChild(_loc4_);
         var _loc5_:ItemFace = new ItemFace(new Goods(709607),65,65);
         _loc5_.x = 10 + 535 + 5;
         _loc5_.y = 85 + 8;
         addChild(_loc5_);
         var _loc6_:ItemFace = new ItemFace(new Goods(721637),65,65);
         _loc6_.x = 20;
         _loc6_.y = 85 + 85 + 8;
         addChild(_loc6_);
         var _loc7_:ItemFace = new ItemFace(new Goods(709612),65,65);
         _loc7_.x = 10 + 535 + 5;
         _loc7_.y = 85 + 85 + 8;
         addChild(_loc7_);
         var _loc8_:ItemFace = new ItemFace(new Goods(721637),65,65);
         _loc8_.x = 20;
         _loc8_.y = 85 + 85 + 85 + 3;
         addChild(_loc8_);
         var _loc9_:ItemFace = new ItemFace(new Goods(709612),65,65);
         _loc9_.x = 10 + 535 + 5;
         _loc9_.y = 85 + 85 + 85;
         addChild(_loc9_);
         this.btn1 = new NewSkinButton();
         this.btn1.skin = "ynCZDF_LQ_Button";
         this.btn1.x = 270;
         this.btn1.y = 135;
         this.btn1.name = "1";
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn1);
         this.btn2 = new NewSkinButton();
         this.btn2.skin = "ynCZDF_LQ_Button";
         this.btn2.x = 270 + 220;
         this.btn2.y = 135;
         this.btn2.name = "2";
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn2);
         this.btn3 = new NewSkinButton();
         this.btn3.skin = "ynCZDF_LQ_Button";
         this.btn3.x = 270;
         this.btn3.y = 135 + 80;
         this.btn3.name = "3";
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn3);
         this.btn4 = new NewSkinButton();
         this.btn4.skin = "ynCZDF_LQ_Button";
         this.btn4.x = 270 + 220;
         this.btn4.y = 135 + 80;
         this.btn4.name = "4";
         this.btn4.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn4);
         this.btn5 = new NewSkinButton();
         this.btn5.skin = "ynCZDF_LQ_Button";
         this.btn5.x = 270;
         this.btn5.y = 135 + 80 + 80;
         this.btn5.name = "5";
         this.btn5.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn5);
         this.btn6 = new NewSkinButton();
         this.btn6.skin = "ynCZDF_LQ_Button";
         this.btn6.x = 270 + 220;
         this.btn6.y = 135 + 80 + 80;
         this.btn6.name = "6";
         this.btn6.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn6);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_YN_CHONGZHIDAFA_LINGQU_CLICK,"",param1.target.name));
      }
      
      public function setBtnEn(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            this["btn" + (_loc2_ + 1)].enabled = Boolean(param1[_loc2_]);
            _loc2_++;
         }
      }
   }
}

