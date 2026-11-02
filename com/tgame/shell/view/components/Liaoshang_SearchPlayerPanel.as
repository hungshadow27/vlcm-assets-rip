package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.friend.SearchPlayerListRender;
   import com.tgame.shell.view.components.liaoshang.LiaoshangIntroPanel;
   import com.tgame.shell.view.components.liaoshang.LiaoshangPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class Liaoshang_SearchPlayerPanel extends FPanel
   {
      
      public static const UI_SHUANGXIU_SEARCH_BTN_CLICK:String = "UI_SHUANGXIU_SEARCH_BTN_CLICK";
      
      public static const UI_SHUANGXIU_PAGE_PRE_BTN_CLICK:String = "UI_SHUANGXIU_PAGE_PRE_BTN_CLICK";
      
      public static const UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK:String = "UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK";
      
      public static const UI_LIAOSHANG_LOOK_INFO_BTN_CLICK:String = "UI_LIAOSHANG_LOOK_INFO_BTN_CLICK";
      
      public static const UI_SHUANGXIU_INTRO_BTN_CLICK:String = "UI_SHUANGXIU_INTRO_BTN_CLICK";
      
      public static const UI_SHUANGXIU_START_BTN_CLICK:String = "UI_SHUANGXIU_START_BTN_CLICK";
      
      public static const UI_LIAOSHANG_OK_BTN_CLICK:String = "UI_LIAOSHANG_OK_BTN_CLICK";
      
      public static const UI_LIAOSHANG_CANCEL_BTN_CLICK:String = "UI_LIAOSHANG_CANCEL_BTN_CLICK";
      
      public static const UI_INTRO_CLOSE_BTN_CLICK:String = "UI_INTRO_CLOSE_BTN_CLICK";
      
      private var input:FTextInput;
      
      private var searchBtn:SmallButton;
      
      private var playerList:FList;
      
      private var preBtn:FSimpleButton;
      
      private var count:FTextArea;
      
      private var nextBtn:FSimpleButton;
      
      private var lookBtn:SecondButton;
      
      private var introBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var introPanel:LiaoshangIntroPanel;
      
      public function Liaoshang_SearchPlayerPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 284;
         height = 267;
         titleText = LanResManager.getLanCommonTextWords("查询玩家");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.friend.player.search.ui";
         addChild(img);
         img.x = 6;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
         lb = new FLabel();
         with(lb)
         {
            x = 30;
            y = 8;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("玩家名字");
         }
         addChild(lb);
         this.input = new FTextInput();
         with(this.input)
         {
            x = 90;
            y = 8;
            textColor = StaticValue.WHITE;
         }
         this.input.setMaxChars(12);
         addChild(this.input);
         this.searchBtn = new SmallButton();
         this.searchBtn.label = LanResManager.getLanCommonTextWords("查询");
         addChild(this.searchBtn);
         this.searchBtn.x = 216;
         this.searchBtn.y = 8;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 30;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("查找结果");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 57;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名字");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 158;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 220;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派");
         }
         addChild(lb);
         this.playerList = new FList();
         this.playerList.skin = "list";
         this.playerList.itemRenderer = new SearchPlayerListRender();
         this.playerList.listWidth = 266;
         this.playerList.listHeight = 100;
         addChild(this.playerList);
         this.playerList.x = 9;
         this.playerList.y = 74;
         lb = new FLabel();
         with(lb)
         {
            x = 10;
            y = 180;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本处只会返回受伤玩家搜索结果");
         }
         addChild(lb);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 186;
         this.preBtn.y = 180;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FTextArea();
         with(this.count)
         {
            x = 206;
            y = 180;
            width = 25;
            height = 20;
            textColor = StaticValue.WHITE;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            text = "0";
         }
         addChild(this.count);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 234;
         this.nextBtn.y = 180;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanCommonTextWords("查看资料");
         addChild(this.lookBtn);
         this.lookBtn.x = 50;
         this.lookBtn.y = 212;
         this.lookBtn.enabled = false;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.introBtn = new SecondButton();
         this.introBtn.label = LanResManager.getLanCommonTextWords("双修简介");
         addChild(this.introBtn);
         this.introBtn.x = (width - this.introBtn.width) / 2;
         this.introBtn.y = 212;
         this.introBtn.visible = false;
         this.introBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("开始治疗");
         addChild(this.okBtn);
         this.okBtn.x = width - this.okBtn.width - 50;
         this.okBtn.y = 212;
         this.okBtn.enabled = false;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.searchBtn:
               if(this.input.text == "")
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("请输入名字"));
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_SHUANGXIU_SEARCH_BTN_CLICK,"",this.input.text));
               }
               break;
            case this.preBtn:
               dispatchEvent(new BaseEvent(UI_SHUANGXIU_PAGE_PRE_BTN_CLICK));
               break;
            case this.nextBtn:
               dispatchEvent(new BaseEvent(UI_SHUANGXIU_PAGE_NEXT_BTN_CLICK));
               break;
            case this.lookBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_LIAOSHANG_LOOK_INFO_BTN_CLICK,"",int(this.playerList.selectItem.label)));
               break;
            case this.introBtn:
               dispatchEvent(new BaseEvent(UI_SHUANGXIU_INTRO_BTN_CLICK));
               break;
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_SHUANGXIU_START_BTN_CLICK,"",int(this.playerList.selectItem.label)));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.lookBtn.enabled = false;
         this.okBtn.enabled = false;
         this.playerList.dataProvider = <list/>;
         if(this.introPanel.parent)
         {
            this.introPanel.parent.removeChild(this.introPanel);
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setList(param1:XML, param2:int) : void
      {
         this.playerList.dataProvider = param1;
         if(param1.children().length() == 0)
         {
            this.lookBtn.enabled = this.okBtn.enabled = false;
         }
         else
         {
            this.playerList.setSelectItemByIndex(0);
            this.lookBtn.enabled = this.okBtn.enabled = true;
            this.playerList.setSelectItemByIndex(0);
         }
         this.count.text = param2.toString();
      }
      
      public function showIntroPanel() : void
      {
         if(this.introPanel == null)
         {
            this.introPanel = new LiaoshangIntroPanel();
         }
         addChild(this.introPanel);
         this.introPanel.visible = true;
         this.introPanel.x = -this.introPanel.width;
         this.introPanel.y = -25;
         this.introPanel.addEventListener(FCloseEvent.CLOSE,this.introClose);
      }
      
      public function hideIntroPanel() : void
      {
         if(Boolean(this.introPanel) && Boolean(this.introPanel.parent))
         {
            this.introPanel.parent.removeChild(this.introPanel);
            this.introPanel.removeEventListener(FCloseEvent.CLOSE,this.introClose);
         }
      }
      
      private function introClose(param1:FCloseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_INTRO_CLOSE_BTN_CLICK));
      }
      
      public function showShuangXiuPanel(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String) : void
      {
         var _loc7_:LiaoshangPanel = new LiaoshangPanel();
         _loc7_.$parent = this;
         _loc7_.show(param1,param2,param3,param4,param5,param6);
         POPWindowManager.showWindow(_loc7_);
      }
   }
}

