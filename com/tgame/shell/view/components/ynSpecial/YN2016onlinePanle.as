package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YN2016onlinePanle extends FPanel
   {
      
      public static const YN_2016ONLINE_BTN_CLICK:String = "YN_2016ONLINE_BTN_CLICK";
      
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
      
      private var ft_time:FTextArea;
      
      private var itemArr:Array = [];
      
      public function YN2016onlinePanle()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 600;
         height = 441 - 58;
         titleText = LanResManager.getLanCommonTextWords("春节七天在线领奖");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         var _loc3_:Bitmap = null;
         var _loc4_:FLabel = null;
         var _loc5_:NewButton = null;
         this.bgleftup = StaticValue.getBitmapByClassName("ui.huodong.leijidenglu.ui1");
         this.bgleftup.width = 112;
         this.bgleftup.height = 30;
         this.bgleftup.x = 10;
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
            _loc3_.x = 10;
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
         this.bg9left.x = 10;
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
         this.titleright.x = 430;
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
         this.ft_time = new FTextArea();
         this.ft_time.x = 200;
         this.ft_time.y = 10;
         this.ft_time.textColor = StaticValue.YELLOW;
         this.ft_time.width = 300;
         this.ft_time.htmlText = "在线时长：";
         addChild(this.ft_time);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(YN_2016ONLINE_BTN_CLICK));
      }
      
      public function setleijidengluData(param1:Array, param2:int) : void
      {
         var _loc10_:int = 0;
         var _loc11_:Bitmap = null;
         var _loc12_:Goods = null;
         var _loc13_:ItemFace = null;
         var _loc14_:NewButton = null;
         var _loc15_:Bitmap = null;
         var _loc3_:int = int(this.itemArr.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            removeChild(this.itemArr[_loc4_] as ItemFace);
            _loc4_++;
         }
         this.itemArr.length = 0;
         var _loc5_:int = int(this.lingquBmpArr.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            removeChild(this.lingquBmpArr[_loc6_] as Bitmap);
            _loc6_++;
         }
         this.lingquBmpArr.length = 0;
         var _loc7_:int = int(param1.length);
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_)
         {
            _loc8_ = int(param1[_loc9_].goodarr.length);
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc11_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               _loc11_.x = 144 + _loc10_ * 46;
               _loc11_.y = 36 + 44 * _loc9_;
               addChild(_loc11_);
               _loc12_ = new Goods(param1[_loc9_].goodarr[_loc10_].id);
               _loc12_.count = param1[_loc9_].goodarr[_loc10_].count;
               _loc13_ = new ItemFace(_loc12_);
               addChild(_loc13_);
               _loc13_.x = 144 + _loc10_ * 46 + 2;
               _loc13_.y = 36 + 44 * _loc9_ + 2;
               this.itemArr.push(_loc13_);
               _loc14_ = this.btnArr[_loc9_] as NewButton;
               _loc14_.enabled = param1[_loc9_].enabled == 0 ? false : true;
               if(param1[_loc9_].islingqu == 1)
               {
                  _loc15_ = new Bitmap(this.lingqu);
                  addChild(_loc15_);
                  _loc15_.x = 500;
                  _loc15_.y = 32 + 45 * _loc9_;
               }
               _loc10_++;
            }
            _loc9_++;
         }
         if(param2 == -1)
         {
            this.ft_time.htmlText = LanResManager.getLanCommonTextWords("已在线超过30分钟，可以领奖");
         }
         else
         {
            this.ft_time.htmlText = LanResManager.getLanCommonTextWords("在线时长：") + int(param2 / 60) + LanResManager.getLanCommonTextWords("分");
         }
      }
   }
}

