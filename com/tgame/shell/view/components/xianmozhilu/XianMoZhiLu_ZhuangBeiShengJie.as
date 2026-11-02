package com.tgame.shell.view.components.xianmozhilu
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class XianMoZhiLu_ZhuangBeiShengJie extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var putBtn:SmallButton;
      
      private var startBtn:SecondButton;
      
      private var kuang1:Bitmap;
      
      private var kuang2:Bitmap;
      
      private var kuang3:Bitmap;
      
      private var nanShiKa:FLabel;
      
      private var nvShiKa:FLabel;
      
      private var equip1:ItemFace;
      
      private var equip2:ItemFace;
      
      private var item:ItemFace;
      
      private var needNum:int;
      
      private var needGoodsID:int;
      
      public function XianMoZhiLu_ZhuangBeiShengJie()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         this.width = 279 + 18;
         this.height = 379 + 42 - 130;
         this.titleText = "装备升级";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.putBtn);
         this.putBtn.x = 115;
         this.putBtn.y = 33;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onPutClick);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始转换");
         addChild(this.startBtn);
         this.startBtn.x = (279 + 18 - this.startBtn.width) / 2;
         this.startBtn.y = 227;
         this.startBtn.enabled = false;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onPutClick);
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang1.x = 74;
         this.kuang1.y = 60;
         addChild(this.kuang1);
         this.kuang2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang2.x = 182;
         this.kuang2.y = 60;
         addChild(this.kuang2);
         this.kuang3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang3.x = 33;
         this.kuang3.y = 139;
         addChild(this.kuang3);
         this.nanShiKa = new FLabel();
         this.nanShiKa.textColor = StaticValue.WHITE;
         this.nanShiKa.filters = StaticValue.filter;
         this.nanShiKa.x = 80;
         this.nanShiKa.y = 141;
         addChild(this.nanShiKa);
         this.nanShiKa.text = "本次消耗材料：神魔石*0";
         this.nvShiKa = new FLabel();
         this.nvShiKa.textColor = StaticValue.WHITE;
         this.nvShiKa.filters = StaticValue.filter;
         this.nvShiKa.x = 80;
         this.nvShiKa.y = 159;
         addChild(this.nvShiKa);
         this.nvShiKa.text = "本次成功几率：0%";
         this.setGoodsChangeHandler();
      }
      
      private function onPutClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
               {
                  dispatchEvent(new BaseEvent(XianMoZhiLuPanel.UI_EQUIP_PUT_CLICK));
               }
               else
               {
                  dispatchEvent(new BaseEvent(XianMoZhiLuPanel.UI_EQUIP_GET_CLICK));
               }
               break;
            case this.startBtn:
               dispatchEvent(new BaseEvent(XianMoZhiLuPanel.UI_ZHUANHUAN_START_CLICK));
         }
      }
      
      public function setZhuangBeiYuLanData(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0) : void
      {
         if(Boolean(this.equip1) && Boolean(this.equip1.parent))
         {
            this.equip1.parent.removeChild(this.equip1);
         }
         if(param1)
         {
            this.equip1 = new ItemFace(new Goods(param1));
            addChild(this.equip1);
            this.equip1.x = 76;
            this.equip1.y = 62;
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出装备");
            this.startBtn.enabled = true;
            this.needNum = param4;
            this.needGoodsID = param3;
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入装备");
            this.startBtn.enabled = false;
            this.needNum = 0;
            this.needGoodsID = 0;
         }
         if(Boolean(this.equip2) && Boolean(this.equip2.parent))
         {
            this.equip2.parent.removeChild(this.equip2);
         }
         if(param2)
         {
            this.equip2 = new ItemFace(new Goods(param2));
            addChild(this.equip2);
            this.equip2.x = 184;
            this.equip2.y = 62;
         }
         this.setGoodsChangeHandler();
      }
      
      public function setGoodsChangeHandler() : void
      {
         var _loc2_:int = 0;
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         var _loc1_:Goods = new Goods(47360);
         this.item = new ItemFace(_loc1_);
         addChild(this.item);
         this.item.x = 35;
         this.item.y = 141;
         this.item.filters = Tools.blackWhiteFilter;
         if(this.needGoodsID)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.needGoodsID,true);
            if(_loc2_ < this.needNum && this.needNum != 0)
            {
               this.item.filters = Tools.blackWhiteFilter;
               this.nanShiKa.text = "本次消耗材料：神魔石*" + this.needNum;
               this.nvShiKa.text = "本次成功几率：" + 100 + "%";
            }
            else
            {
               this.item.filters = [];
               this.nanShiKa.text = "本次消耗材料：神魔石*" + this.needNum;
               this.nvShiKa.text = "本次成功几率：" + 100 + "%";
            }
         }
      }
      
      public function reset() : void
      {
         this.setZhuangBeiYuLanData();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
      }
   }
}

