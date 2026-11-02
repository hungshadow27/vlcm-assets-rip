package com.tgame.shell.view.components.xidushidai
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class EquipPartyChangePanel extends FPanel
   {
      
      public static const UI_EQUIP_PUT_CLICK:String = "UI_EQUIP_PUT_CLICK";
      
      public static const UI_EQUIP_GET_CLICK:String = "UI_EQUIP_GET_CLICK";
      
      public static const UI_ZHUANHUAN_START_CLICK:String = "UI_ZHUANHUAN_START_CLICK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var partyBtn:SecondButton;
      
      private var index:int;
      
      private var bg:DisplayObject;
      
      private var container:Sprite;
      
      private var putBtn:SmallButton;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var startBtn:SecondButton;
      
      private var equip1:ItemFace;
      
      private var equip2:ItemFace;
      
      private var item:ItemFace;
      
      private var bg1:DisplayObject;
      
      public function EquipPartyChangePanel()
      {
         var str:String;
         var i:int;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         this.width = 279 + 18;
         this.height = 379 + 42;
         this.titleText = LanResManager.getLanCommonTextWords("门派转换");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaizhuanhuan/equip/zhbg.swf");
         this.bg1.visible = true;
         this.bg1.x = 10;
         this.bg1.y = 22;
         addChild(this.bg1);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 43;
            y = 5;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("级及以上的装备可以进行门派转转！") + "</font>";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            width = 78;
            height = 60;
            x = 15;
            y = 30;
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("请选择要转换的门派装备") + "</font>";
         }
         addChild(this.ft2);
         str = "";
         i = 1;
         while(i <= 6)
         {
            this.partyBtn = new SecondButton();
            this.partyBtn.x = 20;
            this.partyBtn.y = 110 + (this.partyBtn.height + 2) * (i - 1) - 30;
            addChild(this.partyBtn);
            this.partyBtn.name = String(i);
            this.partyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            switch(i)
            {
               case 1:
                  str = LanResManager.getLanCommonTextWords("少林派");
                  break;
               case 2:
                  str = LanResManager.getLanCommonTextWords("全真派");
                  break;
               case 3:
                  str = LanResManager.getLanCommonTextWords("古墓派");
                  break;
               case 4:
                  str = LanResManager.getLanCommonTextWords("桃花岛");
                  break;
               case 5:
                  str = LanResManager.getLanCommonTextWords("白驼山");
                  break;
               case 6:
                  str = LanResManager.getLanCommonTextWords("明教");
            }
            this.partyBtn.label = str;
            i++;
         }
         this.container = new Sprite();
         this.container.x = 130;
         this.container.y = 48;
         addChild(this.container);
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.putBtn);
         this.putBtn.x = 105;
         this.putBtn.y = 163;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onPutClick);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 30;
            y = 268 - 10;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.img.x = 25;
         this.img.y = 382;
         this.ft = new FTextArea();
         with(this.ft)
         {
            filters = StaticValue.filter;
            x = 100 - 20;
            y = 264 + 10;
            textColor = StaticValue.BlUE20;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.ft);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始转换");
         addChild(this.startBtn);
         this.startBtn.x = (279 + 18 - this.startBtn.width) / 2;
         this.startBtn.y = 357;
         this.startBtn.enabled = false;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onPutClick);
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
         this.index = param1.currentTarget.name;
         this.setPic(this.index);
      }
      
      private function setPic(param1:int) : void
      {
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         if(param1 == 0)
         {
            return;
         }
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaizhuanhuan/equip/" + param1 + ".swf");
         this.container.addChild(this.bg);
      }
      
      private function onPutClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
               {
                  dispatchEvent(new BaseEvent(UI_EQUIP_PUT_CLICK,"",this.index));
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_EQUIP_GET_CLICK));
               }
               break;
            case this.startBtn:
               dispatchEvent(new BaseEvent(UI_ZHUANHUAN_START_CLICK));
         }
      }
      
      public function setEquip(param1:Goods = null, param2:Goods = null) : void
      {
         if(Boolean(this.equip1) && Boolean(this.equip1.parent))
         {
            this.equip1.parent.removeChild(this.equip1);
         }
         if(param1)
         {
            this.equip1 = new ItemFace(param1);
            addChild(this.equip1);
            this.equip1.x = 116;
            this.equip1.y = 192;
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出装备");
            this.startBtn.enabled = true;
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入装备");
            this.startBtn.enabled = false;
         }
         if(Boolean(this.equip2) && Boolean(this.equip2.parent))
         {
            this.equip2.parent.removeChild(this.equip2);
         }
         if(param2)
         {
            this.equip2 = new ItemFace(param2);
            addChild(this.equip2);
            this.equip2.x = 224;
            this.equip2.y = 192;
         }
      }
      
      public function setEnergyExpendItem(param1:int, param2:int, param3:int, param4:Boolean = true, param5:Goods = null) : void
      {
         this.ft.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次消耗铜钱：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("本次消耗材料：") + param5.res.name + "X" + param1 + "<br>" + LanResManager.getLanCommonTextWords("本次成功几率：") + param3 / 100 + "%" + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：转换门派不会改变任何属性！") + "</font></textformat>";
         this.fb1.text = param5.res.name;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param5);
         this.item.x = 35;
         this.item.y = 291;
         addChild(this.item);
         if(param4)
         {
            this.item.filters = [];
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function reset() : void
      {
         this.setEquip();
         this.setEnergyExpendItem(0,0,0,false,new Goods(40826));
         this.setPic(0);
      }
      
      public function onClosePanel() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

