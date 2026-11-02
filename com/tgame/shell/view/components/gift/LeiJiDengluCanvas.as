package com.tgame.shell.view.components.gift
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.GiftPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class LeiJiDengluCanvas extends Sprite
   {
      
      private var titleleft:FLabel;
      
      private var titleright:FLabel;
      
      public var $parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var bg9:F9GridBitmap;
      
      private var bg9left:F9GridBitmap;
      
      private var bgleftup:Bitmap;
      
      private var bgleftdown:BitmapData;
      
      private var lingqu:BitmapData;
      
      private var titleArr:Array = [LanResManager.getLanCommonTextWords("第一天"),LanResManager.getLanCommonTextWords("第二天"),LanResManager.getLanCommonTextWords("第三天"),LanResManager.getLanCommonTextWords("第四天"),LanResManager.getLanCommonTextWords("第五天"),LanResManager.getLanCommonTextWords("第六天"),LanResManager.getLanCommonTextWords("第七天")];
      
      private var btnArr:Array = [];
      
      private var lingquBmpArr:Array = [];
      
      private var itemArr:Array = [];
      
      public function LeiJiDengluCanvas()
      {
         var _loc1_:int = 0;
         var _loc3_:Bitmap = null;
         var _loc4_:FLabel = null;
         var _loc5_:NewButton = null;
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 0;
         this.fc1.skin = "box";
         this.fc1.width = 590;
         this.fc1.height = 342;
         addChild(this.fc1);
         this.bgleftup = StaticValue.getBitmapByClassName("ui.huodong.leijidenglu.ui1");
         this.bgleftup.width = 112;
         this.bgleftup.height = 30;
         this.bgleftup.x = 2;
         this.bgleftup.y = 2;
         addChild(this.bgleftup);
         this.bgleftdown = StaticValue.getBitmapByClassName("ui.huodong.leijidenglu.ui2").bitmapData;
         this.lingqu = StaticValue.getBitmapByClassName("ui.huodong.leijidenglu.lingqu").bitmapData;
         _loc1_ = 0;
         while(_loc1_ < 7)
         {
            _loc3_ = new Bitmap(this.bgleftdown);
            _loc3_.width = 112;
            _loc3_.height = 44;
            _loc3_.x = 2;
            _loc3_.y = _loc1_ * 44 + 33;
            addChild(_loc3_);
            _loc4_ = new FLabel();
            _loc4_.text = this.titleArr[_loc1_];
            _loc4_.y = _loc1_ * 44 + 48;
            _loc4_.x = 35;
            _loc4_.textColor = StaticValue.WHITE;
            _loc4_.filters = StaticValue.filter;
            addChild(_loc4_);
            _loc1_++;
         }
         this.bg9 = Tools.get9GridBitmpByName("biwuDahui_bg");
         this.bg9.x = 114;
         this.bg9.y = 2;
         this.bg9.width = 474;
         this.bg9.height = 338;
         addChild(this.bg9);
         this.bg9left = Tools.get9GridBitmpByName("leijidenglu_bg");
         this.bg9left.x = 2;
         this.bg9left.y = 2;
         this.bg9left.width = 112;
         this.bg9left.height = 338;
         addChild(this.bg9left);
         this.titleleft = new FLabel();
         this.titleleft.text = LanResManager.getLanCommonTextWords("登录天数");
         this.titleleft.x = 33 - 24;
         this.titleleft.y = 10;
         this.titleleft.textColor = StaticValue.YELLOW;
         this.titleleft.filters = StaticValue.filter;
         addChild(this.titleleft);
         this.titleright = new FLabel();
         this.titleright.text = LanResManager.getLanCommonTextWords("获得奖励");
         this.titleright.x = 326;
         this.titleright.y = 10;
         this.titleright.textColor = StaticValue.YELLOW;
         this.titleright.filters = StaticValue.filter;
         addChild(this.titleright);
         var _loc2_:int = 0;
         while(_loc2_ < 7)
         {
            _loc5_ = new NewButton();
            _loc5_.name = (_loc2_ + 1).toString();
            _loc5_.label = LanResManager.getLanCommonTextWords("领取");
            _loc5_.width = 60;
            _loc5_.align = "center";
            addChild(_loc5_);
            _loc5_.x = 500;
            _loc5_.y = 41 + _loc2_ * 43;
            _loc5_.addEventListener(MouseEvent.CLICK,this.onBtnClick);
            this.btnArr.push(_loc5_);
            _loc2_++;
         }
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:NewButton = param1.target as NewButton;
         this.$parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_LEIJIDENGLU_CLICK,"",parseInt(_loc2_.name)));
      }
      
      public function setleijidengluData(param1:Array) : void
      {
         var _loc9_:int = 0;
         var _loc10_:Goods = null;
         var _loc11_:ItemFace = null;
         var _loc12_:NewButton = null;
         var _loc13_:Bitmap = null;
         var _loc2_:int = int(this.itemArr.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            removeChild(this.itemArr[_loc3_] as ItemFace);
            _loc3_++;
         }
         this.itemArr.length = 0;
         var _loc4_:int = int(this.lingquBmpArr.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            removeChild(this.lingquBmpArr[_loc5_] as Bitmap);
            _loc5_++;
         }
         this.lingquBmpArr.length = 0;
         var _loc6_:int = int(param1.length);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc7_ = int(param1[_loc8_].goodarr.length);
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc10_ = new Goods(param1[_loc8_].goodarr[_loc9_].id);
               _loc10_.count = param1[_loc8_].goodarr[_loc9_].count;
               _loc11_ = new ItemFace(_loc10_);
               addChild(_loc11_);
               _loc11_.x = 144 + _loc9_ * 46;
               _loc11_.y = 36 + 44 * _loc8_;
               this.itemArr.push(_loc11_);
               _loc12_ = this.btnArr[_loc8_] as NewButton;
               _loc12_.enabled = param1[_loc8_].enabled == 0 ? false : true;
               _loc12_.visible = param1[_loc8_].islingqu == 1 ? false : true;
               if(param1[_loc8_].islingqu == 1)
               {
                  _loc13_ = new Bitmap(this.lingqu);
                  addChild(_loc13_);
                  _loc13_.x = 500;
                  _loc13_.y = 32 + 45 * _loc8_;
               }
               _loc9_++;
            }
            _loc8_++;
         }
      }
   }
}

