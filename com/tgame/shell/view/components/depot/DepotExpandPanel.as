package com.tgame.shell.view.components.depot
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.DepotPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class DepotExpandPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var item:ItemFace;
      
      private var tip:FLabel;
      
      private var tip1:FLabel;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var buyBtn:SmallButton;
      
      private var lb1:FLabel;
      
      private var lb3:FLabel;
      
      public function DepotExpandPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         super();
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 257;
         height = 204;
         titleText = LanResManager.getLanCommonTextWords("格数扩展");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 28;
         img.y = 35;
         this.buyBtn = new SmallButton();
         this.buyBtn.x = 32;
         this.buyBtn.y = 75;
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.buyBtn);
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onBuy);
         lb = new FLabel();
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 28;
            y = 18;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("扩展符");
         }
         addChild(this.lb1);
         lb = new FLabel();
         with(lb)
         {
            x = 118;
            y = 18;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("获得途径");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 84;
            y = 35;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("1.参与线上活动获得");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 84;
            y = 55;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("2.通过商城付费购买");
         }
         addChild(lb);
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 84;
            y = 75;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("3.击杀野外BOSS获得");
         }
         addChild(this.lb3);
         this.tip = new FLabel();
         with(this.tip)
         {
            x = 8;
            y = 2;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.tip);
         this.tip1 = new FLabel();
         with(this.tip1)
         {
            x = 10;
            y = 100;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.tip1);
         lb = new FLabel();
         with(lb)
         {
            x = 10;
            y = 120;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("激活后您将获得额外30个物品存储格");
         }
         addChild(lb);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 36;
         this.okBtn.y = 147;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - 36 - this.cancelBtn.width;
         this.cancelBtn.y = 147;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(DepotPanel.UI_DEPOTPANEL_JIHUO_DEPOT_OK));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onBuy(param1:MouseEvent) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[this.item.getBaseItem().id,0]);
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function show(param1:int, param2:Goods, param3:Boolean) : void
      {
         this.lb1.text = param2.res.name;
         this.lb1.x = 28;
         this.lb3.visible = true;
         if(this.item != null && this.item.parent != null)
         {
            removeChild(this.item);
         }
         this.item = new ItemFace(param2);
         if(!param3)
         {
            this.tip.textColor = StaticValue.RED;
            this.item.filters = Tools.blackWhiteFilter;
            this.okBtn.enabled = false;
         }
         else
         {
            this.tip.textColor = StaticValue.GREEN;
            this.okBtn.enabled = true;
         }
         addChild(this.item);
         this.item.x = 30;
         this.item.y = 37;
         if(param1 == 2)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[2,2]);
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活仓库X吗",[2]);
         }
         if(param1 == 3)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[3,6]);
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活仓库X吗",[3]);
         }
         if(param1 == 4)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[4,18]);
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活仓库X吗",[4]);
         }
         if(param1 == 5)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[5,50]);
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活仓库X吗",[5]);
         }
      }
      
      public function showChaoji(param1:int, param2:Goods, param3:Boolean) : void
      {
         this.lb1.text = param2.res.name;
         this.lb1.x = 14;
         this.lb3.visible = false;
         if(this.item != null && this.item.parent != null)
         {
            removeChild(this.item);
         }
         this.item = new ItemFace(param2);
         if(!param3)
         {
            this.tip.textColor = StaticValue.RED;
            this.item.filters = Tools.blackWhiteFilter;
            this.okBtn.enabled = false;
         }
         else
         {
            this.tip.textColor = StaticValue.GREEN;
            this.okBtn.enabled = true;
         }
         addChild(this.item);
         this.item.x = 30;
         this.item.y = 37;
         if(param1 == 6)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[6,1]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活仓库X吗",[6]);
         }
         if(param1 == 7)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[7,1]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[7]);
         }
         if(param1 == 8)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[8,2]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[8]);
         }
         if(param1 == 9)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[9,2]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[9]);
         }
         if(param1 == 10)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[10,3]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[10]);
         }
         if(param1 == 11)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[11,5]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[11]);
         }
         if(param1 == 12)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[12,10]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[12]);
         }
         if(param1 == 13)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[13,20]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[13]);
         }
         if(param1 == 14)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[14,30]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[14]);
         }
         if(param1 == 15)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[15,40]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[15]);
         }
         if(param1 > 15 && param1 <= 20)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"激活仓库X需要在背包中有X个“扩展符”",[param1,50]) + param2.res.name;
            this.tip1.text = LanResManager.getLanTextWords(this,"请问您是要激活行囊X吗",[param1]);
         }
      }
   }
}

