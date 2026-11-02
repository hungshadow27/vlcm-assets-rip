package com.tgame.shell.view.components.ride
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TongLingTianFuCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var colorBar:ColorBar;
      
      private var btn1:SmallButton;
      
      private var btn2:SmallButton;
      
      private var tip1:FTextArea;
      
      private var tip2:FTextArea;
      
      public function TongLingTianFuCanvas()
      {
         var _loc2_:TextFormat = null;
         var _loc3_:FTextArea = null;
         super();
         var _loc1_:Bitmap = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.bg.bar");
         addChild(_loc1_);
         _loc1_.x = 0;
         _loc1_.y = 75;
         _loc1_.width = 328;
         _loc1_ = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.bg.bar");
         addChild(_loc1_);
         _loc1_.x = 0;
         _loc1_.y = 207;
         _loc1_.width = 328;
         _loc1_ = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.bg.bar");
         addChild(_loc1_);
         _loc1_.x = 0;
         _loc1_.y = 324;
         _loc1_.width = 328;
         _loc2_ = new TextFormat();
         _loc2_.align = "center";
         _loc2_.bold = true;
         _loc2_.size = 14;
         _loc3_ = new FTextArea();
         _loc3_.textColor = StaticValue.WHITE;
         _loc3_.filters = StaticValue.filter;
         _loc3_.x = 10;
         _loc3_.y = 15;
         _loc3_.wordWrap = true;
         _loc3_.width = 305;
         _loc3_.height = 70;
         addChild(_loc3_);
         _loc3_.htmlText = "<textformat leading=\'6\'><font size=\'13\'>" + LanResManager.getLanCommonTextWords("在您的坐骑进阶到龙鳞圣兽以上后，将拥有通灵能力，使用龙兽通灵丹，可激活圣兽的通灵天赋") + "</font></textformat>";
         _loc3_ = new FTextArea();
         _loc3_.textColor = StaticValue.YELLOW;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.filters = StaticValue.filter;
         _loc3_.x = 10;
         _loc3_.y = 76;
         _loc3_.width = 305;
         _loc3_.height = 20;
         addChild(_loc3_);
         _loc3_.text = LanResManager.getLanCommonTextWords("圣兽通灵操作");
         _loc3_ = new FTextArea();
         _loc3_.textColor = StaticValue.YELLOW;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.filters = StaticValue.filter;
         _loc3_.x = 15;
         _loc3_.y = 113;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         addChild(_loc3_);
         _loc3_.text = LanResManager.getLanCommonTextWords("通灵丹");
         var _loc4_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(_loc4_);
         _loc4_.x = 38;
         _loc4_.y = 140;
         _loc3_ = new FTextArea();
         _loc3_.textColor = StaticValue.YELLOW;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.filters = StaticValue.filter;
         _loc3_.x = 10;
         _loc3_.y = 208;
         _loc3_.width = 305;
         _loc3_.height = 20;
         addChild(_loc3_);
         _loc3_.text = LanResManager.getLanCommonTextWords("圣兽通灵天赋");
         _loc4_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(_loc4_);
         _loc4_.x = 38;
         _loc4_.y = 250;
         var _loc5_:FLabel = new FLabel();
         _loc5_.x = 30;
         _loc5_.y = 113;
         addChild(_loc5_);
         _loc5_.autoSize = TextFieldAutoSize.LEFT;
         _loc5_.textColor = StaticValue.WHITE;
         _loc5_.filters = StaticValue.filter;
         _loc5_.text = LanResManager.getLanCommonTextWords("通灵天赋激活进度：");
         var _loc6_:Bitmap = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(_loc6_);
         _loc6_.x = 150;
         _loc6_.y = 115;
         this.colorBar = new ColorBar(5,123,5,true,true);
         addChild(this.colorBar);
         this.colorBar.x = 154;
         this.colorBar.y = 118;
         this.tip1 = new FTextArea();
         this.tip1.textColor = StaticValue.WHITE;
         this.tip1.filters = StaticValue.filter;
         this.tip1.autoSize = TextFieldAutoSize.LEFT;
         this.tip1.x = 85;
         this.tip1.y = 133;
         addChild(this.tip1);
         this.tip1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"每次操作消耗：",[StaticValue.GREEN_HTML,1,StaticValue.GREEN_HTML,100,StaticValue.GREEN_HTML,5]) + "</textformat>";
         this.btn1 = new SmallButton();
         this.btn1.label = LanResManager.getLanCommonTextWords("开始通灵");
         addChild(this.btn1);
         this.btn1.x = 220;
         this.btn1.y = 184;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         _loc3_ = new FTextArea();
         _loc3_.textColor = StaticValue.WHITE;
         _loc3_.filters = StaticValue.filter;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.width = 240;
         _loc3_.height = 75;
         addChild(_loc3_);
         _loc3_.x = 85;
         _loc3_.y = 245;
         _loc3_.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"凝气为丹") + "</textformat>";
         this.btn2 = new SmallButton();
         this.btn2.label = LanResManager.getLanCommonTextWords("点此制造");
         addChild(this.btn2);
         this.btn2.x = 220;
         this.btn2.y = 302;
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip2 = new FTextArea();
         this.tip2.textColor = StaticValue.WHITE;
         this.tip2.filters = StaticValue.filter;
         this.tip2.width = 305;
         this.tip2.height = 20;
         this.tip2.defaultTextFormat = StaticValue.format;
         this.tip2.x = 10;
         this.tip2.y = 326;
         addChild(this.tip2);
         this.tip2.htmlText = LanResManager.getLanTextWords(this,"您当前的圣兽已经累计为您制造1",[StaticValue.GREEN_HTML,0]);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_STRAT));
               break;
            case this.btn2:
               this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_CREATE));
         }
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      public function setTongLingDan(param1:Goods, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:String = null;
         if(Boolean(this.item1) && Boolean(this.item1.parent))
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(param1);
         if(param1.count < param4)
         {
            this.item1.filters = Tools.blackWhiteFilter;
            _loc7_ = StaticValue.RED_HTML;
         }
         else
         {
            this.item1.filters = [];
            _loc7_ = StaticValue.GREEN_HTML;
         }
         addChild(this.item1);
         this.item1.x = 40;
         this.item1.y = 142;
         this.tip1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"每次操作消耗：",[_loc7_,param4,StaticValue.GREEN_HTML,param5,StaticValue.GREEN_HTML,param6]) + "</textformat>";
         this.colorBar.setValue(param3,100);
         if(param3 == 100)
         {
            this.btn1.label = LanResManager.getLanCommonTextWords("已通灵");
            this.btn1.enabled = false;
         }
         else
         {
            this.btn1.label = LanResManager.getLanCommonTextWords("开始通灵");
            this.btn1.enabled = true;
         }
      }
      
      public function setLongQiDan(param1:Goods, param2:int) : void
      {
         if(Boolean(this.item2) && Boolean(this.item2.parent))
         {
            this.item2.parent.removeChild(this.item2);
         }
         this.item2 = new ItemFace(param1);
         addChild(this.item2);
         this.item2.x = 40;
         this.item2.y = 252;
         this.tip2.htmlText = LanResManager.getLanTextWords(this,"您当前的圣兽已经累计为您制造",[StaticValue.GREEN_HTML,param2]);
      }
   }
}

