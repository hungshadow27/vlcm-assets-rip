package com.tgame.shell.view.components.huodong
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class TutengShuxingTihuankaPanel extends FPanel
   {
      
      public static const UI_TUTENGSHUXINGKA_SETEQUIPBTN_CLICK:String = "UI_TUTENGSHUXINGKA_SETEQUIPBTN_CLICK";
      
      public static const UI_TUTENGSHUXINGKA_GETEQUIPBTN_CLICK:String = "UI_TUTENGSHUXINGKA_GETEQUIPBTN_CLICK";
      
      public static const UI_TUTENGSHUXINGKA_OK_CLICK:String = "UI_TUTENGSHUXINGKA_OK_CLICK";
      
      private var setEquipBtn:SmallButton;
      
      private var equipContainer:Sprite;
      
      private var selectGrade:FLabel;
      
      private var selectBtn:FSimpleButton;
      
      private var selectList:FList;
      
      private var listContainer:FCanvas;
      
      private var okBtn:SecondButton;
      
      private var zhanwenId:int;
      
      private var line:Bitmap;
      
      private var lb:FLabel;
      
      private var fta:FTextArea;
      
      public function TutengShuxingTihuankaPanel()
      {
         var searchBg:F9GridBitmap;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 306;
         height = 230;
         titleText = LanResManager.getLanCommonTextWords("图腾属性替换卡");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.setEquipBtn = new SmallButton();
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.setEquipBtn);
         this.setEquipBtn.x = 16;
         this.setEquipBtn.y = 14;
         this.setEquipBtn.addEventListener(MouseEvent.CLICK,this.onSetEquip);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.line);
         this.line.x = 24;
         this.line.y = 40;
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 26;
         this.equipContainer.y = 42;
         this.fta = new FTextArea();
         this.fta.autoSize = TextFieldAutoSize.LEFT;
         this.fta.x = 80;
         this.fta.y = 35 - 8;
         this.fta.width = 220;
         this.fta.wordWrap = true;
         this.fta.textColor = StaticValue.GREEN;
         this.fta.filters = StaticValue.filter;
         this.fta.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanCommonTextWords("青龙战纹攻击增强") + " " + LanResManager.getLanCommonTextWords("朱雀战纹伤害反弹") + "<br>" + LanResManager.getLanCommonTextWords("白虎战纹忽视防御") + " " + LanResManager.getLanCommonTextWords("玄武战纹伤害减免") + "</textformat>";
         addChild(this.fta);
         this.fta = new FTextArea();
         this.fta.autoSize = TextFieldAutoSize.LEFT;
         this.fta.x = 15;
         this.fta.y = 85 + 3;
         this.fta.width = 285;
         this.fta.wordWrap = true;
         this.fta.textColor = StaticValue.WHITE;
         this.fta.filters = StaticValue.filter;
         this.fta.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"玩家装备图腾属性达到梦幻满值忽视防御最高伤害反弹伤害减免攻击",[StaticValue.GREEN_HTML,StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.fta);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 80;
            y = 14;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请选择图腾战纹：");
         }
         addChild(this.lb);
         searchBg = Tools.get9GridBitmpByName("inputBg");
         searchBg.width = 68;
         addChild(searchBg);
         searchBg.x = 173;
         searchBg.y = 11;
         this.selectGrade = new FLabel();
         with(this.selectGrade)
         {
            x = 175;
            y = 14;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请选择");
         }
         addChild(this.selectGrade);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 242;
         this.selectBtn.y = 12;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         this.listContainer.x = 170;
         this.listContainer.y = 30;
         addChild(this.listContainer);
         this.listContainer.visible = false;
         this.selectList = new FList();
         this.selectList.skin = "list";
         this.selectList.listWidth = 60;
         this.selectList.x = 5;
         this.selectList.y = 4;
         this.selectList.itemRenderer = new StrengthenListRender();
         this.selectList.dataProvider = <list>
														<node label={LanResManager.getLanCommonTextWords("青龙战纹")} id="1"/>
														<node label={LanResManager.getLanCommonTextWords("朱雀战纹")} id="2"/>
														<node label={LanResManager.getLanCommonTextWords("白虎战纹")} id="3"/>
														<node label={LanResManager.getLanCommonTextWords("玄武战纹")} id="4"/>
													</list>;
         this.listContainer.addChild(this.selectList);
         this.selectList.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.listContainer.width = this.selectList.width + 10;
         this.listContainer.height = this.selectList.height + 4;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 130;
         this.okBtn.y = 162;
         this.okBtn.enabled = false;
         this.okBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.setEquip(new Goods(20001),1);
      }
      
      private function aa2(param1:BaseEvent) : void
      {
         this.getEquip();
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         this.listContainer.visible = !this.listContainer.visible;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(this.selectList.selectItem != null)
         {
            if(this.zhanwenId != this.selectList.selectItem.id)
            {
               dispatchEvent(new BaseEvent(UI_TUTENGSHUXINGKA_OK_CLICK,"",this.selectList.selectItem.id));
            }
            else
            {
               FAlert.show(LanResManager.getLanCommonTextWords("请替换其他属性战纹！"),"",1,function(param1:FAlertEvent):void
               {
               });
            }
         }
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         this.selectGrade.text = this.selectList.selectItem.label;
         this.listContainer.visible = false;
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onSetEquip(param1:MouseEvent) : void
      {
         if(this.setEquipBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
         {
            dispatchEvent(new BaseEvent(UI_TUTENGSHUXINGKA_SETEQUIPBTN_CLICK));
         }
         else
         {
            dispatchEvent(new BaseEvent(UI_TUTENGSHUXINGKA_GETEQUIPBTN_CLICK));
         }
      }
      
      public function init() : void
      {
         this.okBtn.enabled = false;
         this.listContainer.visible = false;
      }
      
      public function setEquip(param1:Goods, param2:int) : void
      {
         this.zhanwenId = param2;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.equipContainer.addChild(new ItemFace(param1));
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("取出装备");
         this.okBtn.enabled = true;
      }
      
      public function getEquip() : void
      {
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.setEquipBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         this.okBtn.enabled = false;
      }
   }
}

