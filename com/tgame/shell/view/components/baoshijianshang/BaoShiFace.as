package com.tgame.shell.view.components.baoshijianshang
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextInput;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class BaoShiFace extends Sprite
   {
      
      private var goods:Goods;
      
      private var item:ItemFace;
      
      public var type:int;
      
      public var beishu:Number;
      
      public var Bg_url:String = "ui.huodong.baoshi.slot";
      
      public var yaZhuNum:FTextInput = new FTextInput();
      
      private var addP1Btn:FSimpleButton;
      
      private var subP1Btn:FSimpleButton;
      
      public function BaoShiFace(param1:Array)
      {
         var _loc2_:Number = NaN;
         var _loc3_:Bitmap = null;
         var _loc4_:Bitmap = null;
         var _loc5_:Bitmap = null;
         super();
         _loc3_ = StaticValue.getBitmapByClassName("ui.huodong.baoshi.ban.bg1");
         _loc4_ = StaticValue.getBitmapByClassName("ui.huodong.baoshi.ban.bg2");
         _loc5_ = StaticValue.getBitmapByClassName("ui.huodong.baoshi.kuang");
         this.yaZhuNum = new FTextInput();
         this.yaZhuNum.maxChars = 3;
         this.yaZhuNum.restrict = "0-9";
         this.yaZhuNum.width = 40;
         this.yaZhuNum.height = 20;
         this.yaZhuNum.textColor = StaticValue.YELLOW;
         this.addP1Btn = new FSimpleButton();
         this.addP1Btn.skin = "sumButton";
         this.subP1Btn = new FSimpleButton();
         this.subP1Btn.skin = "subButton";
         switch(param1.length)
         {
            case 1:
               addChild(_loc3_);
               this.goods = new Goods(param1[0]);
               this.item = new ItemFace(this.goods);
               this.item.mouseEnabled = this.item.mouseChildren = false;
               this.item.x = 12;
               this.item.y = 6;
               this.item.setBitmap(this.Bg_url);
               addChild(this.item);
               _loc5_.x = this.item.x + 52;
               _loc5_.y = this.item.y;
               addChild(_loc5_);
               this.yaZhuNum.x = _loc5_.x + 2;
               this.yaZhuNum.y = _loc5_.y + 2;
               addChild(this.yaZhuNum);
               --this.yaZhuNum.x;
               this.addP1Btn.y = this.yaZhuNum.y + 19;
               this.subP1Btn.x = this.yaZhuNum.x + 20;
               this.subP1Btn.y = this.yaZhuNum.y + 19;
               this.addP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
               this.subP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
               addChild(this.addP1Btn);
               addChild(this.subP1Btn);
               break;
            case 2:
               addChild(_loc4_);
               _loc2_ = 0;
               while(_loc2_ < param1.length)
               {
                  this.goods = new Goods(param1[_loc2_]);
                  this.item = new ItemFace(this.goods);
                  this.item.mouseEnabled = this.item.mouseChildren = false;
                  this.item.x = 12 + _loc2_ * 44;
                  this.item.y = 26;
                  this.item.setBitmap(this.Bg_url);
                  addChild(this.item);
                  _loc2_++;
               }
               _loc5_.x = this.item.x + 43;
               _loc5_.y = this.item.y;
               addChild(_loc5_);
               this.yaZhuNum.x = _loc5_.x + 2;
               this.yaZhuNum.y = _loc5_.y + 2;
               addChild(this.yaZhuNum);
               --this.yaZhuNum.x;
               this.addP1Btn.y = this.yaZhuNum.y + 19;
               this.subP1Btn.x = this.yaZhuNum.x + 20;
               this.subP1Btn.y = this.yaZhuNum.y + 19;
               this.addP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
               this.subP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
               addChild(this.addP1Btn);
               addChild(this.subP1Btn);
               break;
            case 4:
               addChild(_loc4_);
               _loc2_ = 0;
               while(_loc2_ < 2)
               {
                  this.goods = new Goods(int(param1[_loc2_]));
                  this.item = new ItemFace(this.goods);
                  this.item.mouseEnabled = this.item.mouseChildren = false;
                  this.item.x = 12 + _loc2_ * 44;
                  this.item.y = 6;
                  this.item.setBitmap(this.Bg_url);
                  addChild(this.item);
                  _loc2_++;
               }
               _loc2_ = 2;
               while(_loc2_ < 4)
               {
                  this.goods = new Goods(int(param1[_loc2_]));
                  this.item = new ItemFace(this.goods);
                  this.item.mouseEnabled = this.item.mouseChildren = false;
                  this.item.x = 12 + (_loc2_ - 2) * 44;
                  this.item.y = 50;
                  this.item.setBitmap(this.Bg_url);
                  addChild(this.item);
                  _loc2_++;
               }
               _loc5_.x = this.item.x + 43;
               _loc5_.y = this.item.y - 23;
               addChild(_loc5_);
               this.yaZhuNum.x = _loc5_.x + 2;
               this.yaZhuNum.y = _loc5_.y + 2;
               addChild(this.yaZhuNum);
               --this.yaZhuNum.x;
               this.addP1Btn.y = this.yaZhuNum.y + 19;
               this.subP1Btn.x = this.yaZhuNum.x + 20;
               this.subP1Btn.y = this.yaZhuNum.y + 19;
               this.addP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
               this.subP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
               addChild(this.addP1Btn);
               addChild(this.subP1Btn);
               break;
            case 5:
               addChild(_loc4_);
               _loc2_ = 0;
               while(_loc2_ < 3)
               {
                  this.goods = new Goods(int(param1[_loc2_]));
                  this.item = new ItemFace(this.goods);
                  this.item.mouseEnabled = this.item.mouseChildren = false;
                  this.item.x = 12 + _loc2_ * 44;
                  this.item.y = 6;
                  this.item.setBitmap(this.Bg_url);
                  addChild(this.item);
                  _loc2_++;
               }
               _loc2_ = 3;
               while(_loc2_ < 5)
               {
                  this.goods = new Goods(int(param1[_loc2_]));
                  this.item = new ItemFace(this.goods);
                  this.item.mouseEnabled = this.item.mouseChildren = false;
                  this.item.x = 12 + (_loc2_ - 3) * 44;
                  this.item.y = 50;
                  this.item.setBitmap(this.Bg_url);
                  addChild(this.item);
                  _loc2_++;
               }
               _loc5_.x = this.item.x + 43;
               _loc5_.y = this.item.y;
               addChild(_loc5_);
               this.yaZhuNum.x = _loc5_.x + 2;
               this.yaZhuNum.y = _loc5_.y + 2;
               addChild(this.yaZhuNum);
               --this.yaZhuNum.x;
               this.addP1Btn.y = this.yaZhuNum.y + 19;
               this.subP1Btn.x = this.yaZhuNum.x + 20;
               this.subP1Btn.y = this.yaZhuNum.y + 19;
               this.addP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
               this.subP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
               addChild(this.addP1Btn);
               addChild(this.subP1Btn);
         }
      }
      
      private function onPoint(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.addP1Btn:
               this.yaZhuNum.text = String(Number(this.yaZhuNum.text) + 1);
               break;
            case this.subP1Btn:
               if(int(this.yaZhuNum.text) > 0)
               {
                  this.yaZhuNum.text = String(Number(this.yaZhuNum.text) - 1);
               }
         }
      }
   }
}

