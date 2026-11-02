package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class LianQiHuoQuPanel extends FPanel
   {
      
      private var barBg1:Bitmap;
      
      private var count:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var guanbiBtn:SecondButton;
      
      private var item:ItemFace;
      
      public var $parent:DisplayObject;
      
      public function LianQiHuoQuPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 270;
         height = 180;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("炼气获取");
         this.barBg1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.barBg1.x = 25;
         this.barBg1.y = 40;
         addChild(this.barBg1);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 100;
         _loc1_.height = 110;
         _loc1_.x = 20 + 9;
         _loc1_.y = 20;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("金锭") + "</font></textformat>";
         addChild(_loc1_);
         this.count = new FTextArea();
         this.count.multiline = true;
         this.count.wordWrap = true;
         this.count.filters = StaticValue.filter;
         this.count.width = 100;
         this.count.height = 40;
         this.count.x = 20 + 80;
         this.count.y = 20 + 25;
         this.count.textColor = StaticValue.ORANGE;
         addChild(this.count);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("使用");
         addChild(this.okBtn);
         this.okBtn.x = 65;
         this.okBtn.y = 115 - 19;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanbiBtn = new SecondButton();
         this.guanbiBtn.label = LanResManager.getLanCommonTextWords("关闭");
         addChild(this.guanbiBtn);
         this.guanbiBtn.x = 100 + 67;
         this.guanbiBtn.y = 115 - 19;
         this.guanbiBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      public function onClose(param1:* = null) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANQI_HUOQU_CLICK));
      }
      
      public function setHuoquInit(param1:int) : void
      {
         this.count.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前使用") + param1 + LanResManager.getLanCommonTextWords("金锭增加10%炼气值") + "</font>";
      }
      
      public function setGoods() : void
      {
         var _loc1_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(9320,true);
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(_loc1_);
         this.item.x = 25 + 2;
         this.item.y = 40 + 2;
         addChild(this.item);
      }
   }
}

