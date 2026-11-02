package com.tgame.shell.view.components.huangjinshu
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class HuangJinShuPanel extends FPanel
   {
      
      public static const UI_HUANGJINSHU_JIAOSHUI_CLICK:String = "UI_HUANGJINSHU_JIAOSHUI_CLICK";
      
      public static const UI_HUANGJINSHU_LINGQU_CLICK:String = "UI_HUANGJINSHU_LINGQU_CLICK";
      
      private var jiaoshuiBtn:SecondButton;
      
      private var lingquBtn:SecondButton;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var item:ItemFace;
      
      public function HuangJinShuPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         skin = "panel";
         width = 450;
         height = 200;
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FTextArea();
         _loc1_.x = 30;
         _loc1_.y = 30;
         _loc1_.wordWrap = true;
         _loc1_.width = 300;
         _loc1_.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有玩家可对黄金树浇灌，每次浇灌消耗1个黄金露水，当浇灌达到满值时，黄金时可结成果子开启全服福利，所有玩家可在黄金树上领取黄金限时兑换卡") + "</font></textformat>";
         addChild(_loc1_);
         this.jiaoshuiBtn = new SecondButton();
         this.jiaoshuiBtn.x = 345;
         this.jiaoshuiBtn.y = 135;
         this.jiaoshuiBtn.label = LanResManager.getLanCommonTextWords("浇灌");
         addChild(this.jiaoshuiBtn);
         this.jiaoshuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn = new SecondButton();
         this.lingquBtn.x = 345;
         this.lingquBtn.y = 100;
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.lingquBtn);
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.width = 170;
         this.img.x = 50 - 30;
         this.img.y = 149 - 11 - 30;
         this.CjBar = new ColorBar(5,132,11);
         addChild(this.CjBar);
         this.CjBar.x = 69 - 30;
         this.CjBar.y = 152 - 11 - 30;
         this.CjBar.setValue(2,2);
         this.setGoods(42860);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.jiaoshuiBtn:
               dispatchEvent(new BaseEvent(UI_HUANGJINSHU_JIAOSHUI_CLICK));
               break;
            case this.lingquBtn:
               dispatchEvent(new BaseEvent(UI_HUANGJINSHU_LINGQU_CLICK));
         }
      }
      
      public function setZhufuzhi(param1:int, param2:Boolean) : void
      {
         this.CjBar.setValue(param1,100);
      }
      
      public function setGoods(param1:int) : void
      {
         var _loc2_:Goods = new Goods(param1);
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(_loc2_);
         this.item.x = 345;
         this.item.y = 47;
         addChild(this.item);
      }
   }
}

